Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECBF7248F49
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 22:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgHRUBV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 16:01:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbgHRUBV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 16:01:21 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D09442075E;
        Tue, 18 Aug 2020 20:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597780880;
        bh=zy0DJ6crLcrypH3lD9l4dj4w6ssPe4VMSpk1lbZA5BM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Qtgzn1a7ZX6SonzuhGNp7SD7UY2VAXRGuIC+/pE00TNCa2PwYhkj8Z7orOCdUUZKi
         Y4NSZTaRC0VGR6O+tOY/JAQ2LdTSsoKftSfHgNDhfJjCn3hY9i4SKlsBp01ErOzosT
         5zQZBXIFYnVfmpBYPPrroUGBQ5Mh2hqGPYFl+cEo=
Date:   Tue, 18 Aug 2020 22:01:18 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Luke Jones <luke@ljones.dev>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        rydberg@bitmath.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH V5] HID: asus: add support for ASUS N-Key keyboard
In-Reply-To: <2HZ9FQ.4JVT3NKM9S0E2@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2008182200090.27422@cbobk.fhfr.pm>
References: <20200818075916.52267-1-luke@ljones.dev> <nycvar.YFH.7.76.2008182034140.27422@cbobk.fhfr.pm> <2HZ9FQ.4JVT3NKM9S0E2@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 Aug 2020, Luke Jones wrote:

> On Tue, Aug 18, 2020 at 20:37, Jiri Kosina <jikos@kernel.org> wrote:
> > On Tue, 18 Aug 2020, Luke Jones wrote:
> >> @@ -751,14 +841,14 @@ static int asus_input_mapping(struct hid_device
> >> *hdev,
> >>         usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
> >>     return -1;
> >> 
> >>  -	/* ASUS-specific keyboard hotkeys */
> >>  -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
> >>  +	/* ASUS-specific keyboard hotkeys and led backlight */
> >>  +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
> >>     switch (usage->hid & HID_USAGE) {
> >>     case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
> >>     case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
> >>     case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
> >>     case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
> >>  -		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
> >>  +		case 0x7c: asus_map_key_clear(KEY_F20);		break;
> > 
> > This change doesn't seem to be mentioned in the changelog; why is it OK in
> > general case for other devices sharing this codepath?
> Do you mean the HID_UP_ASUSVENDOR? This evaluates to 0xff310000. I was unsure
> how to address that - should I mention it in changes?

Nah, that one is clear :)

> The MICMUTE issue: "change "Mic Toggle" to use a keycode that works" maybe I
> should elaborate on this - the keycode appears to be unused or undetected by
> KDE, Gnome, XFCE, and so the mic would never toggle. F20 gives the desired
> effect.

Yes, this one I was wondering about. Please document that in the 
changelog.

> Thank you for the feedback. I will submit a revised patch. Should this 
> be in a new thread as I've done so far, or as a reply here?

Either is fine. But let's wait a bit for Dmitry's ACK first for the new 
keycode constants.

Thanks!

-- 
Jiri Kosina
SUSE Labs

