Return-Path: <linux-input+bounces-6254-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3EA96DD0E
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 17:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85F5B289603
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 15:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009E0C8FE;
	Thu,  5 Sep 2024 14:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="R5CknzMA"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6032AE7F;
	Thu,  5 Sep 2024 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548385; cv=none; b=RiOwRKK0UywhAbfar900QbYfTd3eAQHhAFP9J/IwWJsPGjhcAl7V9jmKIMJIHOAN+ZBdcSeHNHU7Dz7sV+op2LM78dQwi8iYvim/mSDgY64qzCMk/IlnoHMXaA1agICaFSwJjkfNFewdbQyHlIA/UD5gK5vtMGzTgGsX3A8dGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548385; c=relaxed/simple;
	bh=/WbqcSXKAZjuysETot0FJ/0bFCLuRSSb/Vdn2H3+D8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qiw/nI3ltMLL36wBOT9UDR2/0sRt9YzCelovu0FjImNx5EX6PZd79RbVZAsNYV9whSuBUK8ZuS0+wQBDoztDKcTkuQhIbrohbm7Odf9nSpzR6cB8nqOGD3rm5fY+joAgvBhL4oMaZ9K2j3RIL9aqaZ7f+K1aYiGfNOPceso9UCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=R5CknzMA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1725548377;
	bh=/WbqcSXKAZjuysETot0FJ/0bFCLuRSSb/Vdn2H3+D8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R5CknzMAYj1X8OWj8dL+PcoqDOfr30iEd5See+IhTxBbVp2Te3PVb6q6RYYJI8kl0
	 uTLPHpFIQXlwlLde0Xqztl1EPk5oEXoUlxtWL+vz4EIYRnLEyAfDcolf0YAluH3TJM
	 Kz78yCOoxn4J6nWVX7ntd3iAtjPfbGJPpVWa2bV4=
Date: Thu, 5 Sep 2024 16:59:36 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/14] HID: lg: constify fixed up report descriptor
Message-ID: <d8cccb29-45a2-4ac8-8fbe-4de526c98135@t-8ch.de>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
 <20240828-hid-const-fixup-2-v1-13-663b9210eb69@weissschuh.net>
 <66uyx73trgi4m5iybuee5ka4vbulh433o4jpqc4uu4teaflaex@av7xsfwjypy5>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66uyx73trgi4m5iybuee5ka4vbulh433o4jpqc4uu4teaflaex@av7xsfwjypy5>

On 2024-09-05 16:51:48+0000, Benjamin Tissoires wrote:
> As you can see in the b4 reply, I've now applied all of the patches but
> this one. Please see below.

Thanks!

> On Aug 28 2024, Thomas Weißschuh wrote:
> > Now that the HID core can handle const report descriptors,
> > constify them where possible.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  drivers/hid/hid-lg.c | 31 +++++++++++++++++--------------
> >  1 file changed, 17 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
> > index a9be918e2b5c..c1feeb1dd077 100644
> > --- a/drivers/hid/hid-lg.c
> > +++ b/drivers/hid/hid-lg.c
> > @@ -58,7 +58,7 @@
> >   * These descriptors remove the combined Y axis and instead report
> >   * separate throttle (Y) and brake (RZ).
> >   */
> > -static __u8 df_rdesc_fixed[] = {
> > +static const __u8 df_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),                   */
> >  0x09, 0x04,         /*  Usage (Joystick),                       */
> >  0xA1, 0x01,         /*  Collection (Application),               */
> > @@ -124,7 +124,7 @@ static __u8 df_rdesc_fixed[] = {
> >  0xC0                /*  End Collection                          */
> >  };
> >  
> > -static __u8 dfp_rdesc_fixed[] = {
> > +static const __u8 dfp_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),                   */
> >  0x09, 0x04,         /*  Usage (Joystick),                       */
> >  0xA1, 0x01,         /*  Collection (Application),               */
> > @@ -172,7 +172,7 @@ static __u8 dfp_rdesc_fixed[] = {
> >  0xC0                /*  End Collection                          */
> >  };
> >  
> > -static __u8 fv_rdesc_fixed[] = {
> > +static const __u8 fv_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),                   */
> >  0x09, 0x04,         /*  Usage (Joystick),                       */
> >  0xA1, 0x01,         /*  Collection (Application),               */
> > @@ -239,7 +239,7 @@ static __u8 fv_rdesc_fixed[] = {
> >  0xC0                /*  End Collection                          */
> >  };
> >  
> > -static __u8 momo_rdesc_fixed[] = {
> > +static const __u8 momo_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),               */
> >  0x09, 0x04,         /*  Usage (Joystick),                   */
> >  0xA1, 0x01,         /*  Collection (Application),           */
> > @@ -285,7 +285,7 @@ static __u8 momo_rdesc_fixed[] = {
> >  0xC0                /*  End Collection                      */
> >  };
> >  
> > -static __u8 momo2_rdesc_fixed[] = {
> > +static const __u8 momo2_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),               */
> >  0x09, 0x04,         /*  Usage (Joystick),                   */
> >  0xA1, 0x01,         /*  Collection (Application),           */
> > @@ -333,7 +333,7 @@ static __u8 momo2_rdesc_fixed[] = {
> >  0xC0                /*  End Collection                      */
> >  };
> >  
> > -static __u8 ffg_rdesc_fixed[] = {
> > +static const __u8 ffg_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),               */
> >  0x09, 0x04,         /*  Usage (Joystik),                    */
> >  0xA1, 0x01,         /*  Collection (Application),           */
> > @@ -379,7 +379,7 @@ static __u8 ffg_rdesc_fixed[] = {
> >  0xC0                /*  End Collection                      */
> >  };
> >  
> > -static __u8 fg_rdesc_fixed[] = {
> > +static const __u8 fg_rdesc_fixed[] = {
> >  0x05, 0x01,         /*  Usage Page (Desktop),               */
> >  0x09, 0x04,         /*  Usage (Joystik),                    */
> >  0xA1, 0x01,         /*  Collection (Application),           */
> > @@ -431,6 +431,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> >  		unsigned int *rsize)
> >  {
> >  	struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
> > +	const __u8 *ret = NULL;
> 
> Not really happy about this, usually "ret" is an int, and this makes
> things slightly harder to read.

Ack.

> 
> >  
> >  	if ((drv_data->quirks & LG_RDESC) && *rsize >= 91 && rdesc[83] == 0x26 &&
> >  			rdesc[84] == 0x8c && rdesc[85] == 0x02) {
> > @@ -453,7 +454,7 @@ static const __u8 *lg_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> >  		if (*rsize == FG_RDESC_ORIG_SIZE) {
> >  			hid_info(hdev,
> >  				"fixing up Logitech Wingman Formula GP report descriptor\n");
> > -			rdesc = fg_rdesc_fixed;
> > +			ret = fg_rdesc_fixed;
> 
> can't you just return fg_rdesc_fixed after setting *rsize, like you did
> in the other patches?

The code looked like it wanted to avoid multiple return sites.
I tried to preserve that style, but indeed it looks wonky.
I'll resend it with the changes.

