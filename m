Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4BF3427B4
	for <lists+linux-input@lfdr.de>; Fri, 19 Mar 2021 22:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhCSV0t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Mar 2021 17:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhCSV0m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Mar 2021 17:26:42 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 902B0C06175F;
        Fri, 19 Mar 2021 14:26:42 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso9849655oti.11;
        Fri, 19 Mar 2021 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+xQzhNdlIsMDN0TgH12gHLm/2elzRzpsgY5YOadiWhg=;
        b=QV7YbxSmNMi5vVpXHDBmh6U36Nf5E9+U1ZMCqEsnd6p2JCESDBXqIPIQBFyY2hZrHQ
         2n5bTEt2JbKYb5Bpev5cTyzyYEbz88bVhvsrYJ5sE5fu541EyXqB3w5jhZn21zK/lHFk
         AXEa0dWOT/fOGxsz4b5pMiuOwt5N3FmnX3GUjrc6vo1w+juk5BVefbwCP0AGpQG3fbOv
         xJgmc6UeqLgWSlgVOzCYYbsyDWcvs/CdKIJZR/JvWkJdOQl5QKawAeHCoONmPjuw+DLm
         qpwCaUj1mb0TVGtG6Vt7NJmc3PISBJR95KpY1/rkyZ0bEEdjK/HWuEhdPkpVHQWg3TiN
         DsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+xQzhNdlIsMDN0TgH12gHLm/2elzRzpsgY5YOadiWhg=;
        b=rIb+VXkeR8EZzMK6RmvsanwImX/9r3KapXkTpN0+ayhU3hpMsq4KSps7O8K4QuzOA/
         mzh/ZK3Q8YfThG64aRTfYcjystN0Nx2Jm75tkgN0cKQ0Yd8AiAo2WUUi2pQ9b6Lc53UH
         LGpOBkhvvLy18PZKKLVmYjjiJnvGGzOyc2yTXg/cnj45G2rEHOp6kl9eEzUaf7PAHbCs
         ZXAF4WgIKXtYg/4kUku04wCPZ0Nh5LbZXNXmnpLOAQmiBpiBDGTQ0dFW23AICpwNAVVv
         N+aQ92glPbyWyzin06bfQ5hinO4q1D4zZceian5yxBvSChl7Fvo9440wGg6cuKT+wLHK
         7l4w==
X-Gm-Message-State: AOAM532z1eYOcOE47OrFbqr6tVgUqAiNfCwpa7io0wPqJLL7K0VCEgBc
        mwXLR/zfOJlH5lcGsUwkY+8=
X-Google-Smtp-Source: ABdhPJx99MlGz0XkiS/XyUc3k/BGrOAXXu5A8chtqoLenKnuIL0j5vdqgMbxr+qAVwyIdHjPyu5+dA==
X-Received: by 2002:a9d:6545:: with SMTP id q5mr2593915otl.179.1616189202036;
        Fri, 19 Mar 2021 14:26:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 53sm1426781oti.77.2021.03.19.14.26.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 14:26:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 Mar 2021 14:26:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jonas Malaco <jonas@protocubo.io>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: add driver for NZXT Kraken X42/X52/X62/X72
Message-ID: <20210319212640.GA23767@roeck-us.net>
References: <20210319045544.416138-1-jonas@protocubo.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319045544.416138-1-jonas@protocubo.io>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 19, 2021 at 01:55:44AM -0300, Jonas Malaco wrote:
> These are "all-in-one" CPU liquid coolers that can be monitored and
> controlled through a proprietary USB HID protocol.
> 
> While the models have differently sized radiators and come with varying
> numbers of fans, they are all indistinguishable at the software level.
> 
> The driver exposes fan/pump speeds and coolant temperature through the
> standard hwmon sysfs interface.
> 
> Fan and pump control, while supported by the devices, are not currently
> exposed.  The firmware accepts up to 61 trip points per channel
> (fan/pump), but the same set of trip temperatures has to be maintained
> for both; with pwmX_auto_point_Y_temp attributes, users would need to
> maintain this invariant themselves.
> 
> Instead, fan and pump control, as well as LED control (which the device
> also supports for 9 addressable RGB LEDs on the CPU water block) are
> left for existing and already mature user-space tools, which can still
> be used alongside the driver, thanks to hidraw.  A link to one, which I
> also maintain, is provided in the documentation.
> 
> The implementation is based on USB traffic analysis.  It has been
> runtime tested on x86_64, both as a built-in driver and as a module.
> 
> Signed-off-by: Jonas Malaco <jonas@protocubo.io>

Applied (after removing the now unnecessary spinlock.h include).

Thanks,
Guenter
