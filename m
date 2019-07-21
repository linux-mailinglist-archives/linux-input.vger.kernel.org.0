Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 410B76F237
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 09:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbfGUH7T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 03:59:19 -0400
Received: from chill.innovation.ch ([216.218.245.220]:36404 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfGUH7T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 03:59:19 -0400
Date:   Sun, 21 Jul 2019 00:59:18 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch CA36E640132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1563695958;
        bh=85s/Zwul/fllYig0yNhV92XVaSDlTwg2Bq4gJ/UTtl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fP7x5e2sS9tvJxTTLCvHjpMXKjF2lozHDuMCc5DiWonTcInZk4dhNPmGW364IgfTa
         g4xzYtprETX4P9Kp1Bh4nqfz4crB2bJ93iaPS5H5KLB/e9UYHFgXcqs2phu1XIZ1LT
         xJEzVLhceaHHOo2VTrx/sIQNJyNsHxmpX1sNeO3r0Veez08/5OtYORLfHMShSuDXDS
         NOUp1xorXI9w9XYmdJFi/Px/2l4flpMtkVvKSnSdNmYdrEX7AbvgVvCqfkAWO+54QZ
         zbgYg+Ozu/qtTp974jcQpXvQumIAAze/HZ0z0tVsjZA7+5fzS3ClcwQ7imiZyKkyrr
         gukVp+qnuh+KA==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Federico Lorenzi <federico@travelground.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] Input: applespi: fix warnings detected by sparse
Message-ID: <20190721075918.GC7992@innovation.ch>
References: <20190721070629.24932-1-ronald@innovation.ch>
 <20190721072427.GB607@penguin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190721072427.GB607@penguin>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


  Hi Dmitry,

On Sun, Jul 21, 2019 at 10:24:27AM +0300, Dmitry Torokhov wrote:
> On Sun, Jul 21, 2019 at 12:06:29AM -0700, Ronald Tschalär wrote:
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
> > ---
> >  drivers/input/keyboard/applespi.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> > index d5defdefbc34..00cd8dccd4f5 100644
> > --- a/drivers/input/keyboard/applespi.c
> > +++ b/drivers/input/keyboard/applespi.c
> > @@ -998,10 +998,14 @@ static inline int le16_to_int(__le16 x)
> >  static void applespi_debug_update_dimensions(struct applespi_data *applespi,
> >  					     const struct tp_finger *f)
> >  {
> > -	applespi->tp_dim_min_x = min_t(int, applespi->tp_dim_min_x, f->abs_x);
> 
> Should we also make tp_dim_* u16? Then we won't need min_t here.

abs_x/abs_y are actually signed values and sometimes negative, and
hence tp_dim_min_* are negative here. But we can just replace the
min_t/max_t with min/max, since both args are now int's.


  Cheers,

  Ronald

