Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392141379CF
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2020 23:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgAJWnk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 17:43:40 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54528 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgAJWnk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 17:43:40 -0500
Received: by mail-pj1-f68.google.com with SMTP id kx11so1540896pjb.4;
        Fri, 10 Jan 2020 14:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jPrk7zuG+HY1liFsXK+JhrFU4Y3b2ZXex7GcTn2hwIE=;
        b=O5QBqQUW2zBY03DRcBuiSm3c2hi7f+joDpQ6jTnTBL1a4e8I+C0u8Grkn5yykHx+TS
         8SLsRm+9ssjWZ6Ek2lFuIvmH8ipKT1e+vXT3ZGDJJy5tbr1yjMvUw2KcgU84Y3m/uM9D
         RmDIP4niCxpymufz9qu29ycvM1gJzIV9FT/h8pwVSUPn10OtllTAIqQ/QGg1DIOB9zoG
         CtrIp5A9xFveJl406FHGLlOjmLE865R2B0pPoSHy3S9WlGsIlRoCjFbMhL2CdifsbFk6
         aguFe961w81hTrxU4Ue0zLcykM/ju/sU0QoQSLBGoYJ2W4VMapCbBIo6M4jzA7Pp9smf
         revA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jPrk7zuG+HY1liFsXK+JhrFU4Y3b2ZXex7GcTn2hwIE=;
        b=rwLk2LqVoQwLQvjU0Gzu4zD/cpkffdHb0O+AeCi84ETTo0odVxNS5cHCssNdylJ6h/
         Oww5s+ZfgEo7FdLqP3kaVSkg6e1dLbAv+qKKPa3Khb2h34BuO4014pZdDzb/L2tS4ySw
         A2FVC+/+1UzYqMALCAx+mwhxCw/7R1/osSwDldG5u1qxja90pzjZXUBhiwQx3AUvQQB9
         uuGLPkf0yq90BA39Qx3Q5aExIq4PMqvQa68bateDDDR5wctWkRLFFgnF5/8jmnemlyM7
         zCz8+puG++sGhzz39n4MwroG5cHgiKUN23g39x5YisvUoc4QQkYxm/YXfzuZuzNw0jJX
         DPVQ==
X-Gm-Message-State: APjAAAXFBQRB+o6sdRA0S0D2o5bVxdiWXM+HTdAZQoINhbjGZ6VndhnI
        foIfjBGjjx682X+dYHbXEr8=
X-Google-Smtp-Source: APXvYqx8C376XLUQF+Qae1VGS8oDujb9EbvmZ7XJEIm9Q8dzKLptqt2BQrbQPYR4GKRtrrPDh6XwoQ==
X-Received: by 2002:a17:902:8d96:: with SMTP id v22mr997126plo.262.1578696218915;
        Fri, 10 Jan 2020 14:43:38 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p5sm3893728pgs.28.2020.01.10.14.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 14:43:38 -0800 (PST)
Date:   Fri, 10 Jan 2020 14:43:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vladis Dronov <vdronov@redhat.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Input: fix USB alsetting bugs
Message-ID: <20200110224336.GV8314@dtor-ws>
References: <20191210113737.4016-1-johan@kernel.org>
 <20191212152518.7117-1-vdronov@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212152518.7117-1-vdronov@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 12, 2019 at 04:25:18PM +0100, Vladis Dronov wrote:
> Hello,
> 
> On 10.12.19 12:37, Johan Hovold wrote:
> 
> > We had quite a few driver using the first alternate setting instead of
> > the current one when doing descriptor sanity checks. This is mostly an
> > issue on kernels with panic_on_warn set due to a WARN() in
> > usb_submit_urn(). Since we've started backporting such fixes (e.g. as
> > reported by syzbot), I've marked these for stable as well.
> > 
> > Included are also a couple of related clean ups to prevent future
> > issues.
> 
> For the series:
> 
> Acked-by: Vladis Dronov <vdronov@redhat.com>

Applied the lot, thank you.

-- 
Dmitry
