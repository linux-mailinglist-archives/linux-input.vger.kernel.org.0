Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B31DDD4F
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 10:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfJTI3b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 04:29:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46591 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfJTI3b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 04:29:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id q24so4984390plr.13;
        Sun, 20 Oct 2019 01:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CkX1DXk675dVGEW9k+dzI2Gf6TIjrOnAAUtgCFcsc5U=;
        b=LQZp17mtTPYjnuq09DCxanBK1vJNNV4g7aY96d2+9vfp20jkEOeQDQK8sVE/DoeA4b
         WFfUxYGRPyeBMGdTFd33gb7dCJXB9WkvoXStuwdru8Qt+64bJNzxKr236ikxlm3tNJfX
         dnnefTN32cEyPs7oKE4hCkloRHlDo+Ukfl2tdnD6LfwSPQHKO8IevdzE8PuZEddAptdt
         O6h59gnkeJs39EyJrOdS6Vpb7NgICnyXdmmSfOi8yswPjCis8UOfOt5IfNN3e3hP/cqr
         mgJQTO6hp+Hm33LQCpblGhMlJtGX7M7Ffh73veLNkfa+AM7bl9q85wSYKf781bNOyKq2
         LDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CkX1DXk675dVGEW9k+dzI2Gf6TIjrOnAAUtgCFcsc5U=;
        b=NTfIsP5JVCL0mUIgI9q5Ys7psAD0ygdU1afOsVD2dVdjUZjlPW9YDnJRl6hDsgdDyG
         2wgOtsSRaU2ct1hAEwGihWDIXj6nLYNYSSimqUdiBhUsITkaJsCcYd1G8B06ljBVPPXq
         7ady2xBmpy3BSLkcR45L+u9QAkjwL83lhNf+MbWgThg7bjnCgAUfrIDGr2DYro00pYKn
         uJBz4TDJXHUZMcG/vGIicEM6eg7BjPB6aQt/buzLLyq7kKE6RaSpvFiBnUeIGmsCETEb
         Pgo4AFNEz7EQW99VMK5fdJ2zsItRWzgJ8ple9xRXqhGqYuhAbPz0rzbtGWjgmVX0ZZi9
         ixEA==
X-Gm-Message-State: APjAAAWwMQNnlY0ktm+g7u49fF85QOLOik63OTDLkY3MwzwcDE+wCDEO
        T8Gjv8MZwl1JdGYVsRX3VWM=
X-Google-Smtp-Source: APXvYqyuIM2AD3UCaurSvmdkbtulDuc6Rwic08wglohWRL9avHpor8TF31+sllni4co3lDHFhwKkLw==
X-Received: by 2002:a17:902:8d84:: with SMTP id v4mr18997043plo.220.1571560170764;
        Sun, 20 Oct 2019 01:29:30 -0700 (PDT)
Received: from Dixit ([2409:4041:2e94:9da:ad82:e9e7:4d8d:d2dd])
        by smtp.gmail.com with ESMTPSA id v9sm11173431pfe.109.2019.10.20.01.29.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 01:29:30 -0700 (PDT)
Date:   Sun, 20 Oct 2019 13:59:19 +0530
From:   Dixit Parmar <dixitparmar19@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        kuninori.morimoto.gx@renesas.com, robh@kernel.org,
        matthias.fend@wolfvision.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver:st1633: fixed multitouch incorrect coordinates
Message-ID: <20191020082919.GB3917@Dixit>
References: <1566209314-21767-1-git-send-email-dixitparmar19@gmail.com>
 <8cfedf751fc87f5f1c660cfda69d36ce@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cfedf751fc87f5f1c660cfda69d36ce@posteo.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Any review comments for this?
Or it should be merged?

Thanks.


On Thu, Aug 22, 2019 at 02:08:14PM +0200, Martin Kepplinger wrote:
> Am 19.08.2019 12:08 schrieb Dixit Parmar:
> > From: Dixit Parmar <dixitparmar19@gmail.com>
> > 
> > For Sitronix st1633 multi-touch controller driver the co-ordinates
> > reported
> > for multiple fingers were wrong.
> > 
> > So the below mentioned bug was filed,
> > Bugzilla Bug ID: 204561
> > 
> > While reading co-ordinates from specified I2C registers, the X & Y
> > co-ordinates should be read from proper I2C address for particular
> > finger as
> > specified in chip specific datasheet.
> > 
> > for single touch this logic is working fine. However, for multi-touch
> > scenario the logic of reading data from data buffer has issues.
> > 
> > This patch fixes the reading logic from data buffer.
> > 
> > Previous logic:
> > * Offset of X & Y Lower byte coordinate is increased by i no. only(by 1
> > Byte)
> >   for each finger.
> > 
> > New logic:
> > * The logic of reading X & Y Lower Byte coordinate needs to be increased
> >   by i+y for each time/finger.
> > 
> > Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> > ---
> >  drivers/input/touchscreen/st1232.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/st1232.c
> > b/drivers/input/touchscreen/st1232.c
> > index 3492339..1139714 100644
> > --- a/drivers/input/touchscreen/st1232.c
> > +++ b/drivers/input/touchscreen/st1232.c
> > @@ -81,8 +81,10 @@ static int st1232_ts_read_data(struct st1232_ts_data
> > *ts)
> >  	for (i = 0, y = 0; i < ts->chip_info->max_fingers; i++, y += 3) {
> >  		finger[i].is_valid = buf[i + y] >> 7;
> >  		if (finger[i].is_valid) {
> > -			finger[i].x = ((buf[i + y] & 0x0070) << 4) | buf[i + 1];
> > -			finger[i].y = ((buf[i + y] & 0x0007) << 8) | buf[i + 2];
> > +			finger[i].x = ((buf[i + y] & 0x0070) << 4) |
> > +					buf[i + y + 1];
> > +			finger[i].y = ((buf[i + y] & 0x0007) << 8) |
> > +					buf[i + y + 2];
> 
> Seems like you're right. It's simply +1 (for x) and +2 (for y) from the
> high-byte locations.
> Not sure how that went wrong.
> 
> Thank you,
> 
> Reviewed-by: Martin Kepplinger <martink@posteo.de>
> 
> 
> > 
> >  			/* st1232 includes a z-axis / touch strength */
> >  			if (ts->chip_info->have_z)
> 
