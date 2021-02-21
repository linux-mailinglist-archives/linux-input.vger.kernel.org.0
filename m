Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30F3320A0B
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhBULiG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:38:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:55106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229540AbhBULiG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:38:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5AB864EEC;
        Sun, 21 Feb 2021 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613907445;
        bh=kCdL/Te4D+LL3d+PI2Typ5xusLBtsLbjwlWh0jaDUOY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YMrrSzLcG62KweXU57vgVp/mQKdOo5ucXJ0OUhXD9hYzZdQFBBwORUXGn/8q/bSwa
         to1yroG4T2rW/t9UAl1fv6jSuoDrrwHEkLyiVV4RUdxkcL8oTJ5gFuyYfCrNrrSzqN
         WGq4PUvw94QTW7rkxUsoGqyRGNajE47TxrLOCOy89u4TmubzBuuZqGrCg9mE8B3zly
         aHqLxy/g/+oKepwHJvc7YlXA1gVceiH6Anxf+kQnDSANzE9TSgIR52E4ucsppgb92x
         PuyOxtrvOfQivTy0GTLfESbKjrGCOZaPr9yNft+DgSHLGc4VWHKFb0c5u05VTCDMJQ
         ByJ25IBBbcGtw==
Date:   Sun, 21 Feb 2021 12:37:22 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 6/7] HID: lenovo: Map mic-mute button to KEY_F20
 instead of KEY_MICMUTE
Message-ID: <20210221123722.5446fc13@kernel.org>
In-Reply-To: <5bda52b5-0f6e-8bce-e53c-108081da87ee@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
        <20210220122438.21857-7-hdegoede@redhat.com>
        <20210221024225.4310028d@nic.cz>
        <5bda52b5-0f6e-8bce-e53c-108081da87ee@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 21 Feb 2021 11:42:16 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
> 
> On 2/21/21 2:42 AM, Marek Behun wrote:
> > On Sat, 20 Feb 2021 13:24:37 +0100
> > Hans de Goede <hdegoede@redhat.com> wrote:
> >   
> >> Mapping the mic-mute button to KEY_MICMUTE is technically correct but
> >> KEY_MICMUTE translates to a scancode of 256 (248 + 8) under X,
> >> which does not fit in 8 bits, so it does not work.  
> > 
> > Why does it need to fit 8 bits? Where is the problem?  
> 
> As the commit message says, "under X" aka X11 / Xorg. This is a well known
> limitation of the X11 input stack / of XKB *as implemented in X11*
> the Wayland input stack does not have this limitations and does allow
> using raw key-codes >= 248.
> 
> If you look at e.g. :
> https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
> 
> Which (mostly) maps custom PS/2 scancodes used for some "media" keys
> on laptops to linux evdev KEY_FOO codes, then you will see that there
> are no lines there which end with "=micmute" instead there are quite
> a few lines like this:
> 
>  KEYBOARD_KEY_8a=f20                                    # Microphone mute button; should be micmute
> 
> Arguably it would be more correct to have the kernel still send
> KEY_MICMUTE and do the remapping to KEY_F20 in userspace in e.g. hwdb.
> 
> But that will not work here, the remapping is done based on mapping
> the HID usage-code to a new evdev KEY_FOO code, basically overriding
> lenovo_input_mapping_tp10_ultrabook_kbd() mapping.
> 
> But the "Lenovo ThinkPad 10 Ultrabook Keyboard" uses the same 0x000c0001
> usage code for all of its custom Fn+F# media keys, so instead of doing
> the mapping purely on usage-code it is done on a combination of usage-code +
> the index of the key in the input-report (since the usage-code is not unique
> for a single key):
> 
>         /*
>          * The ThinkPad 10 Ultrabook Keyboard uses 0x000c0001 usage for
>          * a bunch of keys which have no standard consumer page code.
>          */
>         if (usage->hid == 0x000c0001) {
>                 switch (usage->usage_index) {
>                 case 8: /* Fn-Esc: Fn-lock toggle */
>                         map_key_clear(KEY_FN_ESC);
>                         return 1;
>                 case 9: /* Fn-F4: Mic mute */
>                         map_key_clear(LENOVO_KEY_MICMUTE);
>                         return 1;
> 		...
> 
> 
> So in this case we cannot fixup the mapping from userspace, as userspace
> remapping is purely done based on the "scancode" which in case of HID devices
> is the HID usage-code.
> 
> I don't even know what will happen if we were to try. I guess that either the
> first key with a matching usage-code is remapped, or all of them are remapped,
> both of which are wrong.
> 
> Regards,
> 
> Hans
> 

And no one ever solved this for X? OMFG :(

Very well then.
