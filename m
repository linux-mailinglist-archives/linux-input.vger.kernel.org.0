Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76CA879F1B4
	for <lists+linux-input@lfdr.de>; Wed, 13 Sep 2023 21:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbjIMTG4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 13 Sep 2023 15:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbjIMTG4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Sep 2023 15:06:56 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC34F170F;
        Wed, 13 Sep 2023 12:06:51 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1E8B20003;
        Wed, 13 Sep 2023 19:06:49 +0000 (UTC)
Message-ID: <33c23979dc418a499699e890203930aaa47dbae7.camel@hadess.net>
Subject: Re: [PATCH] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
From:   Bastien Nocera <hadess@hadess.net>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Wed, 13 Sep 2023 21:06:49 +0200
In-Reply-To: <ca55accf-5a7b-43f5-83e0-59c48d0a9389@kadam.mountain>
References: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
         <e0ad67eea72936e44df399e46bb89b7be914419e.camel@hadess.net>
         <ca55accf-5a7b-43f5-83e0-59c48d0a9389@kadam.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2023-09-13 at 20:38 +0300, Dan Carpenter wrote:
> On Wed, Sep 13, 2023 at 04:43:29PM +0200, Bastien Nocera wrote:
> > Hey Dan,
> > 
> > On Thu, 2023-09-07 at 12:55 +0300, Dan Carpenter wrote:
> > > The hid_hw_raw_request() function returns negative error codes or
> > > the
> > > number bytes transferred.  If it returns negative error codes,
> > > then
> > > the
> > > problem is that when we check if "ret <
> > > sizeof(arctis_1_battery_request)",
> > > negative values are type promoted to high unsigned values and
> > > treated
> > > as
> > > success.  Add an explicit check for negatives to address this
> > > issue.
> > 
> > I would be grateful if you could either add the compiler's error
> > message or explain in greater details the integer type promotion
> > (or
> > demotion from signed to unsigned in this case) in the commit
> > message.
> > 
> 
> This is a Smatch warning but you have to have built the cross
> function
> database and I only know one other person who does that for sure...
> 
> drivers/hid/hid-steelseries.c:393
> steelseries_headset_arctis_1_fetch_battery()
> warn: error code type promoted to positive: 'ret'
> 
> I can add that and resend.

That would be great, thanks!

> 
> > > Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1
> > > XBox")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > 
> > 
> > 
> > > ---
> > >  drivers/hid/hid-steelseries.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-
> > > steelseries.c
> > > index 43d2cf7153d7..485d2287d58a 100644
> > > --- a/drivers/hid/hid-steelseries.c
> > > +++ b/drivers/hid/hid-steelseries.c
> > > @@ -390,7 +390,7 @@ static int
> > > steelseries_headset_arctis_1_fetch_battery(struct hid_device
> > > *hdev)
> > >         ret = hid_hw_raw_request(hdev,
> > > arctis_1_battery_request[0],
> > >                                  write_buf,
> > > sizeof(arctis_1_battery_request),
> > >                                  HID_OUTPUT_REPORT,
> > > HID_REQ_SET_REPORT);
> > > -       if (ret < sizeof(arctis_1_battery_request)) {
> > > +       if (ret < 0 || ret < sizeof(arctis_1_battery_request)) {
> > 
> > I prefer:
> > -       if (ret < sizeof(arctis_1_battery_request)) {
> > +       if (ret < (int) sizeof(arctis_1_battery_request)) {
> > 
> > although I'm not sure that's the kernel-style for this sort of
> > checks.
> > 
> 
> I grepped to see which format is more popular and it's 14 vs 13 in
> favor
> of casting.  I prefer to avoid casts, but I can resend.
> 
> regards,
> dan carpenter
> 
> 

