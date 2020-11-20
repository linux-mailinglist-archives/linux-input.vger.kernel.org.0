Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25F22BA111
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKTDVZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:21:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbgKTDVY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:21:24 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9793EC0613CF;
        Thu, 19 Nov 2020 19:21:24 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id j19so6100319pgg.5;
        Thu, 19 Nov 2020 19:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SZ5cGX6TIQzvHfc+sLD8WT1meM0zZCA5hfHOjkflICI=;
        b=RQnejPO2QsJVsdL5s7jfvnMIKkKvnGInPMq28TkVUnW281UjV0vzL0HuPIJuAHuZcs
         KGz0W0Ru1cBFkA/Ynn8cXNGHtN2bfhfQBoMnWScvWKMud/tgRtE2BtqTjYAa+De4AF3W
         l4nCuol5Mbl9tBVhgtLCCeDp8RkFZEsMxw4f/HMDvlrPczfXAWFidKIOPm9RbhMqgP1x
         xbg1pw01kparSJucCWuNkbhzmyvNfILnZfrSmLBdAVGoJjgCVNeZEpnGTqMzgVBg9njW
         wh2ciLnZO1zoB7EB6Abp/AA4r/DZ0vAfnSlaFaZKwn94ffQ3AYno9QeU7P5I1xcCIJxj
         C4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SZ5cGX6TIQzvHfc+sLD8WT1meM0zZCA5hfHOjkflICI=;
        b=c+9eS01jURh+/RSYTFmgyF2X3/8LRE1nJNAPmSG89NgKC/jaBYb+uiBuLC7Om4U1US
         CZqsMGwkhVaGmTR4Uvvx0A8s9uEMlldQHet9swV/UnuHrsFsUTU+TRcqX4NH1XH8B7sz
         NV+uCL1BOmoB0JvY3yUPxI0kZRCP3AF/mQp8VzS4JbWv+99aTPyA7AztByCxKxWEdQ/n
         AXgDuCFsV8tchVIdFvs/97cv9jsULB5xvaieGa7M4PJ95GAqM1dHxam/C+wxHeVLh6HH
         TZcxRyLkIAzGBVB06G2aRCDVfIIY3HaIdl/z2aDhSH632G81vZSv+gV0LefBzpXknzvc
         2gKw==
X-Gm-Message-State: AOAM530rfCMYNeMLSLX5iFnZSgT+tq9Hu2YD2/sdunKXXY9JVzvYODFv
        XIvSq1Asuk1vfIj6FkDU8gI=
X-Google-Smtp-Source: ABdhPJyiFKvALuFNYwCkyI+z5T+92dZbei18yeCsOjtUZJbZeRSWrs+ojtXI5ywzvEaw9LpfiaohAg==
X-Received: by 2002:aa7:982b:0:b029:197:cb05:a315 with SMTP id q11-20020aa7982b0000b0290197cb05a315mr3705811pfl.33.1605842484147;
        Thu, 19 Nov 2020 19:21:24 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v191sm1493942pfc.19.2020.11.19.19.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:21:23 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:21:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        "VMware, Inc." <pv-drivers@vmware.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 15/15] input: mouse: vmmouse: Demote obvious abuse of
 kernel-doc header
Message-ID: <20201120032121.GU2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-16-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-16-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:02:04AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'cmd' not described in 'VMMOUSE_CMD'
>  drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'in1' not described in 'VMMOUSE_CMD'
>  drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out1' not described in 'VMMOUSE_CMD'
>  drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out2' not described in 'VMMOUSE_CMD'
>  drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out3' not described in 'VMMOUSE_CMD'
>  drivers/input/mouse/vmmouse.c:99: warning: Function parameter or member 'out4' not described in 'VMMOUSE_CMD'
> 
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: "VMware, Inc." <pv-drivers@vmware.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
