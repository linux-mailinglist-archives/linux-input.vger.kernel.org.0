Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27CAAF9ED6
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 01:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKMAGj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 19:06:39 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45866 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKMAGj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 19:06:39 -0500
Received: by mail-pf1-f195.google.com with SMTP id z4so250983pfn.12;
        Tue, 12 Nov 2019 16:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qxixb8eOG9f0Waj85Ii66sBcrPEL1SwYM8/OBShmzIU=;
        b=GwbkzzmFd/3KSzse4oSzV8spTmS1Hq9MSJ+MjSnZA+AyJwybaLEigvuHFIEfbiXS6d
         4+JC3LJHQDNqaajASUJnO1Wh8OxVOD/XO4MCWVkbGFCQIT7yI8nSIHGUX9NNWmiXLOpQ
         x1E3HuSPQU5I02PNA4Ljijlq2jYzndkSPc4wTal6/uxy/vUphPQIu+RNEgVdNRhPdJFp
         UMrT5zav/9u1Ad/hyZOdqet3bZQLmSaXoKjKzrC3Z+vvaj9Ztv1OpNcI6TBFgismEQbH
         D3n0QrVc6HbfkwIa+xnASGfiH/p7C47ueeJMXISnDok9va38S99za/nX9YNPE/INcKvh
         oJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qxixb8eOG9f0Waj85Ii66sBcrPEL1SwYM8/OBShmzIU=;
        b=dyaP+rD7nB285rDe4pV3Z2c2nBJeR3Ec3m0JBgSQVuetgPSd59Bnvpib0clet8RM3i
         WRCD5kEBoApGS/6NL+ATRXxKN87v8xP5Tj3JzK0hAnWlb8W4ZuoDfRMrWRtZVGsdU5i0
         djtXEFvPw1QUiPo/DFG7IspNf9Z9hmt1JCw+fzlvraUnUNlpM0NoEGIpdupI8V8xx3nf
         oWisXj5Q2cgdEP5p38mXm4x1RE588Cr6KaQ97aBr/KlXwfZr5lZuK/a7oVm9DcQLduIg
         uk0BnkyX2juzSLCNg/s5qqvJNxd2TCLSh/moriptZYz2mPuRH+r1erSlrUQmsfrGYg6O
         ++WQ==
X-Gm-Message-State: APjAAAX/Fctsv7pi5XW6N379wtG8oILnHTZtVXzMyqbQ251Z6/KioTo6
        h5HNiRNLhprPGSAfomQ5IEw=
X-Google-Smtp-Source: APXvYqzPPCvZ/xeRcjC/56Xf4OuAS5ZOLvFyuBmwGEvMsuUJyT1ESrXu5+7loQBU2itfymvDEWQ3RQ==
X-Received: by 2002:aa7:9f89:: with SMTP id z9mr755874pfr.123.1573603598329;
        Tue, 12 Nov 2019 16:06:38 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z10sm131918pgg.39.2019.11.12.16.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 16:06:37 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:06:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 1/3] Input: ili210x - do not retrieve/print chip
 firmware version
Message-ID: <20191113000635.GH13374@dtor-ws>
References: <20191112164429.11225-1-TheSven73@gmail.com>
 <20191112233421.eh44mv6ji2tk6ki2@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112233421.eh44mv6ji2tk6ki2@earth.universe>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 13, 2019 at 12:34:21AM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Nov 12, 2019 at 11:44:27AM -0500, Sven Van Asbroeck wrote:
> > The driver's method to retrieve the firmware version on ili2117/
> > ili2118 chip flavours is incorrect. The firmware version register
> > address and layout are wrong.
> > 
> > The firmware version is not actually used anywhere inside or
> > outside this driver. There is a dev_dbg() print, but that is
> > only visible when the developer explicitly compiles in debug
> > support.
> > 
> > Don't make the code more complicated to preserve a feature that
> > no-one is using. Remove all code associated with chip firmware
> > version.
> > 
> > Link: https://lore.kernel.org/lkml/20191111181657.GA57214@dtor-ws/
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Adam Ford <aford173@gmail.com>
> > Cc: <linux-kernel@vger.kernel.org>
> > Cc: linux-input@vger.kernel.org
> > Tree: https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
> > Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> > ---
> 
> The firmware version check does one relevant thing: It tests
> the I2C communication, which tends to be useful for board
> bringup and development boards (which often allow to disconnect
> (touch-)screens).

If/when this is needed I propose we add a separate "lite" xfer check,
similar to what elants_i2c and many other drivers are doing.

Thanks.

-- 
Dmitry
