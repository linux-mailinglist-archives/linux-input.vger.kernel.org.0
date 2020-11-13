Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8512B16C2
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgKMHz3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgKMHz3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:55:29 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC83FC0613D6
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 23:55:28 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id o15so8662032wru.6
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q1l/HymtP+vc378Y/Np+GkoFHr0gL46JSMprjW5gcHg=;
        b=W6OTiDd6PQVAEvsSyoGRQ8WivxpBsXNlhqoESGt9S5UbeeZozWqO7Qas+JXd92QCV/
         7GktRH+eZUUpsqDkPtT6uSG6pwen3Ms7wRwxSIG4wPoqwAjdb7wF099Jo2GJlros1J7k
         drlgUDYHbhlilYG2/zQfYKz+RwKHoXCAgrsx/PlWQoDwNt0WnjWokS5CTT69n6C9SEwN
         DPOp+3YvXUaZi3ENNXQ3cJatpXno5s3HBwcnrPBsGow23gFY+BVLvzjSQ0MMPo6O0+yx
         c4JOgvAnx1rzlvd20YFQu9FHOhg8ATiOmi+3H4jvSZPEgjcfE8rn9GVPU9IrmBMt5wAy
         nhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q1l/HymtP+vc378Y/Np+GkoFHr0gL46JSMprjW5gcHg=;
        b=sPECJ/HFxxIROST+E34XcjF+NlLJ6sq4NsvZtxvUpD6jdnmo9D/IVUSH0IKege4bCx
         jTpf3JbPqfYaQ/wAaWctGmQ28S3SMElV2150LHOXnrNL1Ax86kFas1C0qnldFL5B357u
         RbyzSY6PCLQCBRKjJKEQnNdokuVQtPZqWpxriZwFHjManTBrkbgMR/IBHg6DCSw2Y5LR
         gj/6FRDgIOgQoEX4oGsypoJjSp+PTpweJFOSsV+MQX9YLC1NbER6Y6jsqklYlw8mg/rB
         IvP5oJSe2rXa/6kMqg6wL/6Bjye09LtvCcTBDr4cMZKgRtn0h1qsLECmymXfsZZfrwNU
         SyhQ==
X-Gm-Message-State: AOAM533t0KqdG7s/bf/rOfppZtMOU2tvPVIhWumw/+Hidgs1TMRpHux6
        4lX72Q7wuDNwREOS7qGMJUtccA==
X-Google-Smtp-Source: ABdhPJwdAROKvd2jTLMn2e9z0ekroGImfcvzEP9xJ6DrNTOJZf6VyB+r2rwh7KfCIrzxfU+MsVXscw==
X-Received: by 2002:a5d:4409:: with SMTP id z9mr1668333wrq.309.1605254127639;
        Thu, 12 Nov 2020 23:55:27 -0800 (PST)
Received: from dell ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x63sm9825095wmb.48.2020.11.12.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:55:26 -0800 (PST)
Date:   Fri, 13 Nov 2020 07:55:25 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 06/15] input: touchscreen: melfas_mip4: Remove a bunch of
 unused variables
Message-ID: <20201113075525.GH2787115@dell>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-7-lee.jones@linaro.org>
 <20201113074202.GJ356503@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113074202.GJ356503@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 12 Nov 2020, Dmitry Torokhov wrote:

> On Thu, Nov 12, 2020 at 11:01:55AM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
> >  drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
> >  drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
> >  drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
> >  drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]
> > 
> > Cc: Sangwon Jee <jeesw@melfas.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/input/touchscreen/melfas_mip4.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> > index f67efdd040b24..9c98759098c7a 100644
> > --- a/drivers/input/touchscreen/melfas_mip4.c
> > +++ b/drivers/input/touchscreen/melfas_mip4.c
> > @@ -465,13 +465,9 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
> >  static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
> >  {
> >  	int id;
> > -	bool hover;
> > -	bool palm;
> >  	bool state;
> >  	u16 x, y;
> > -	u8 pressure_stage = 0;
> >  	u8 pressure;
> > -	u8 size;
> >  	u8 touch_major;
> >  	u8 touch_minor;
> >  
> > @@ -480,14 +476,11 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
> >  	case 1:
> >  		/* Touch only */
> >  		state = packet[0] & BIT(7);
> > -		hover = packet[0] & BIT(5);
> > -		palm = packet[0] & BIT(4);
> 
> No really happy that we'd be losing information about protocol. Is there
> a better way to suppress the warning while keeping this info?

Yes.  We can either convert the information to comments, or mark the
variables as __always_unused.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
