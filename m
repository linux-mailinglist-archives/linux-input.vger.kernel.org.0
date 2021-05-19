Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FAE389475
	for <lists+linux-input@lfdr.de>; Wed, 19 May 2021 19:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355554AbhESRMi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 13:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355490AbhESRMi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 13:12:38 -0400
X-Greylist: delayed 4027 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 19 May 2021 10:11:18 PDT
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E8E6C06175F;
        Wed, 19 May 2021 10:11:18 -0700 (PDT)
Date:   Wed, 19 May 2021 19:11:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1621444276;
        bh=UW5EOnJw1PTdktYiMLckFFhJRIzlnxs9XcpFpPI3ktQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I70ea2iIFQR6y8mdJtX8EYqdIqoytiucbbzylNfGNyMyy/xrPuE8+fqJwf7187TYO
         eyUegLWCtIS4w+yGm950v5ViWoX9oMme0/C5R6zGZpmys7i1p6FFAOxLO/v2Bu7QVO
         iQzw+vgWWBtusLm/iF7E+1D3xT8BVGERQWH+qhdI=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: input: Add support for Programmable Buttons
Message-ID: <2acfc492-a8a9-4159-be49-dc4dc5d1614a@t-8ch.de>
References: <61dcf8c7-2dcb-4173-fbbd-9adf3412edb7@redhat.com>
 <20210519160349.609690-1-linux@weissschuh.net>
 <2dc197eb-a222-8af6-f0ab-f722e4f492ca@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dc197eb-a222-8af6-f0ab-f722e4f492ca@redhat.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
X-PGP-Key: https://t-8ch.de/pubkey.asc
X-PGP-Key-Fingerprint: 187EF7CE
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mi, 2021-05-19T18:13+0200, Hans de Goede wrote:
> Hi,
> 
> On 5/19/21 6:03 PM, Thomas Weißschuh wrote:
> > From: Thomas Weißschuh <thomas@t-8ch.de>
> > 
> > Map them to KEY_MACRO# event codes.
> > 
> > These buttons are defined by HID as follows:
> > "The user defines the function of these buttons to control software
> > applications or GUI objects."
> > 
> > This matches the semantics of the KEY_MACRO# input event codes that
> > Linux supports.
> > 
> > Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
> > ---
> >  drivers/hid/hid-debug.c | 11 +++++++++++
> >  drivers/hid/hid-input.c |  1 +
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 18f5e28d475c..7d4dee58d869 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -632,6 +632,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> >  				else
> >  					code += BTN_TRIGGER_HAPPY - 0x10;
> >  				break;
> > +		case HID_CP_CONSUMER_CONTROL: code += KEY_MACRO1; break;
> 
> Shouldn't there be a check here to ensure that we don't map things above KEY_MACRO30 ?
> if we do that then we start hitting other codes like KEY_MACRO_RECORD_START and eventually
> BTN_TRIGGER_HAPPY and after the BTN_TRIGGER_HAPPY range we go over KEY_MAX which I think
> is not supported ?
> 
> Regards,
> 
> Hans

I thought all the other chunks of logic around this one would be affected by
this issue, too.
But actually it seems all the overflowing keys get first assigned to the
BTN_TRIGGER_HAPPY range and after that will be clipped directly by
map_key()/hid_map_usage().

I'll resend the patch.

Thanks,
Thomas
