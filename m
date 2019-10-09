Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28E2D19AC
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 22:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbfJIUkX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 16:40:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34908 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJIUkX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 16:40:23 -0400
Received: by mail-pf1-f193.google.com with SMTP id 205so2394985pfw.2;
        Wed, 09 Oct 2019 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9W4ef/pCmtdvoDU/yX8mr232gTK68/JIL9N8zvhY2fc=;
        b=Qwte4a1Fx6qid/fUYd2t1IzJbRM7TiSu4J5FVCL4syW+oCGUMAlmvoUdz/LKjnek9b
         YFfSnelwKxg0f+HQiFB0YZSEbV2OZfZlH/BnRE4LuWwCdzsEjklflwV86wYutM1Cng+E
         SyBa3PcX3CDqfJ++qzOMwzSyLK4ONKKnJQ/jo9V0sZrcayQUS53btqLekGo2YkCXeym3
         PWvsdg6jN099tFBXlU0/vllWQm/nZ+z7ZqjKuqbd8vjZ9C2Cg0AZTmkWkm0/O4gtFNra
         Ut6BU1/P+s/QbzH/iE4euiKHevwgap4h++55MvXXigN6svH+hjZVgQ4t6XX8lv9stbue
         6OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9W4ef/pCmtdvoDU/yX8mr232gTK68/JIL9N8zvhY2fc=;
        b=Lo/ndencqm9aHx+s3DfKZhfdClzBrDtiLWo74H9m1qXXItYA+vc3ia9ojniZxADoOP
         t6SAtbG8EMFQnzXiqRXrDx2/MpkltL6Ot9slOgsCfLFurbsJHN3BAKNRK8isSRMhKeLS
         rzTG9UNYqMEPTfcwRcYMFUyiT6qHn9jY5AM54RRrhhH76pYgDo7FYFCXDCJjhNPYI/uW
         m3t0DO1UrZYy4DauQcwLOut1FtUqn95MTyRadvwoKgmzGBAHQP38hd9HVmaGLXIm47Op
         aAAM6NBXUlWtYi2GyoiIiWoNY9TQT7TPrqCHl4/kO3Zo1rBFukHf4BmpYzJiODMT1kgn
         KZuQ==
X-Gm-Message-State: APjAAAUunpQIR2bhByGxic3KPXOiDsVSJQshmKkINMWMCFYn53FsOtpS
        M5AcMsoyVWEDDuopSMiQxtyR0xCb
X-Google-Smtp-Source: APXvYqzEkJ7C5JxGBoJREZqUOY/AhJd3x2DaNpH+exyH2v0JMoXam7S1Nu5go85sZIQF+P6HWIPc3Q==
X-Received: by 2002:a63:364b:: with SMTP id d72mr4222678pga.432.1570653620471;
        Wed, 09 Oct 2019 13:40:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v133sm6775807pgb.74.2019.10.09.13.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 13:40:19 -0700 (PDT)
Date:   Wed, 9 Oct 2019 13:40:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andi Shyti <andi@etezian.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: mms114 - add support for mms345l
Message-ID: <20191009204017.GK22365@dtor-ws>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007205021.104402-1-stephan@gerhold.net>
 <20191008220014.GI22365@dtor-ws>
 <20191009072612.GA2814@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009072612.GA2814@jack.zhora.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 09, 2019 at 10:26:12AM +0300, Andi Shyti wrote:
> Hi Dmitry,
> 
> > > There was a related patch [2] that removes I2C_M_NOSTART for all models,
> > > but it seems abandoned and I do not have any other model for testing.
> > > Therefore, this patch implements the least instrusive solution
> > > and only removes I2C_M_NOSTART for MMS345L.
> > 
> > Hmm,  at this point I am inclined to pick up Andi's patch since it seems
> > to work for you and him and it looks like Android drivers are not using
> > I2C_M_NOSTART. I wonder if this was some quirk/big on the platform where
> > it was originally developed.
> 
> I completely forgot about that patch :)
> 
> I should refresh some old work on that device which was left
> undone.
> 
> > Any objections?
> 
> It's OK for me. If you can just update my e-mail, please, when
> applying the patch to "andi@etezian.org". Thanks!

Andi, any chance you could resend it with the new email? One thing that
I try to avoid modifying whenever I can is S-O-B strings...

Thanks.

-- 
Dmitry
