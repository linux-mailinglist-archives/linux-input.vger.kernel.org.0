Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642FF86949
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2019 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390265AbfHHTDi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Aug 2019 15:03:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41395 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390203AbfHHTDi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Aug 2019 15:03:38 -0400
Received: by mail-pf1-f193.google.com with SMTP id m30so44626460pff.8
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2019 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xodYknzJOu3KDXtiFsbVB4gW61TV3RDCaJBJ4+hP1DE=;
        b=FF5Ebw5K1c4tY9Nne2y7zZXbFavQ07Lg+aFIRJhtA2b88Bzsi/wzDfQ2dPLWVgQNzx
         uhuwMy53ALO/493lYloVgFFgjC/Wab0YvS091AsPlhcw+X0EAuncQ4nLeweqVXWrdlpq
         LSy7UjyDXQ8YYgiYzKKTMmPrv25lnPGoBsffV1sWPADP3Tt8HBpMRKPpp9/mh82bXT8f
         8h+r5ab8GNdPxnjL9o0G4TpJWrzQwaFgnD2cQ5/kP3vo6mjP5sVKXyqdde3YOqOe0sfz
         mQTgcGimVba7AvjdnR7aLqUAAhtb8Fmy/7cpNRatqCdJEP5+O9tDVQnaeYNnmkS28tln
         aqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xodYknzJOu3KDXtiFsbVB4gW61TV3RDCaJBJ4+hP1DE=;
        b=rEuDZKASuJLFxDb0t/XJ1g5zmWKwA4RCJOQZVPeKOhNl32qysxEQBJhc19wdUGoxuf
         y10QW9tPAKbGii5138IjM2WMYztVKWjVpuigcfbwW0jjewAKjzmcY+FhYXOzojm5GlPI
         m1oz3sgZKfMnE7iCe61gE9hgGxtPeVqc/ncr9bsWSnObL3cuTJy08v0N9E7nSaUKTn8a
         V6KJPILoOrkuwndkIZZFb3AgM/qfW6Op7Nh8/mtix0AWdKVk5EO+RDAF+ACEm8DL3xgr
         XHAZIH7tdR9qbIlVg7i/D2kAGrjfoguYgzfZbAYa73bHwZVcr/wVDMlhluhO5ggcrY7X
         Lijw==
X-Gm-Message-State: APjAAAWukXW5cdJRnBAO/QFffbVnV21hcM7773u0PWopeKwSuVLfi7YU
        fUrKqRPOaM+tC6vHk4o+ifGlzV2w
X-Google-Smtp-Source: APXvYqytuK6a0uFAMzttaCQxjIWav2veduQd7/1AdCsiUX1DsqLk8ggD05ShNeOeI5Ho5ZzW6eZqrg==
X-Received: by 2002:a62:fb15:: with SMTP id x21mr17596292pfm.233.1565291017299;
        Thu, 08 Aug 2019 12:03:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p65sm95474537pfp.58.2019.08.08.12.03.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 12:03:36 -0700 (PDT)
Date:   Thu, 8 Aug 2019 12:03:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: bu21013_ts: Convert to use GPIO descriptors
Message-ID: <20190808190334.GE178933@dtor-ws>
References: <20190808144458.1258-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808144458.1258-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

On Thu, Aug 08, 2019 at 04:44:58PM +0200, Linus Walleij wrote:
> This driver can use GPIO descriptors rather than GPIO numbers
> without any problems, convert it. Name the field variables after
> the actual pins on the chip rather than the "reset" and "touch"
> names from the devicetree bindings that are vaguely inaccurate.
> 
> No in-tree users pass GPIO numbers in platform data so drop
> this. Descriptor tables can be used to get these GPIOs from a board
> file if need be.

Do you have a device to test this on? I am not very fond of mixing up
devm and non-devm resources, so if we are cleaning it up I'd like to do
more cleanups...

Thanks.

-- 
Dmitry
