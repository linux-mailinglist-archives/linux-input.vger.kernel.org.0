Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDB32BA101
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgKTDTB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726172AbgKTDTB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:19:01 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 621F1C0613CF;
        Thu, 19 Nov 2020 19:19:01 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id p6so1753091plr.7;
        Thu, 19 Nov 2020 19:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=skbqkv68CTjGOOK6Xv2MS2CvdDUdk2K8ZVE9Dsj8WRI=;
        b=ZeANxX9ehNEssgBmNKdEmm9tErayjqFn87dWXRvaWDlmn+Ji+C8Kenkf1+Mb/mDcFo
         ZIKPykKi+reBu9oHzRoivbYsm5M/WaqWY7VWHtfTUek+6NTXFA+rjkCwt2heTRomMuTp
         IEhJii1A/wIiBOA5YkajGxBEzdBs3RhlF+ryfV5lp1JHzij8ELecchVhdscDwyavv4VA
         s3RoGs3ZiedK+uysDE7prEL2m/kzhAd1Vr9/f2GaFHHfRojZaJqUVQ8/jD5C4cna9QEU
         ppnKHsGjUbS5+mXeXrpKLc/jQbIXzprnz+3l5fSBzPQlxsuzbkzXHGmGhTIo0ZVi9A1e
         ZQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=skbqkv68CTjGOOK6Xv2MS2CvdDUdk2K8ZVE9Dsj8WRI=;
        b=I9lo4l7KV+9Jd0Xvl2OjMftKbJLmsgwcNvV+rlNypFIc4auuJ/bGGSVHvPtJFjMWKW
         lmPbigWPEkBb2t1WF+ShQngwoEkw38mtRLdM1n9kBjX8YJop+5ZYNqwR3ELtakkIkkeY
         Ybio7wDmJm0pwInKQF1un21muRuSfwExh+Zm4fEzvzJ18jsqSekmvL5CNFwGzS1wyYv5
         W+2aG7Y371/vSyOUlAxuGaR2brU6BNneZJTdw6sDSHurKEFvrZmbHVfDgo/FhZ3epeyl
         eMAEAXZ/+EupMFBw0Meyjl8YcbUU5Cv8DsarIh38q0sHQdfiSe61ShKvUZaJTpHJDYo2
         i/RA==
X-Gm-Message-State: AOAM530ftox6NjwkVLQAtF5jYxbrMQIosvTOaRqQlmOIpXsr5LdcFxbH
        zQx0KfiHEYJn7E83OyiJ4rE=
X-Google-Smtp-Source: ABdhPJysg+YDxXRpmQCylqbJHRtvKgjXn94mlV5PpiQm0zopp+XIfacy/ylv+M60H3o0riqJvgw3Gg==
X-Received: by 2002:a17:902:7d89:b029:d5:cfb6:e44 with SMTP id a9-20020a1709027d89b02900d5cfb60e44mr12068450plm.28.1605842340924;
        Thu, 19 Nov 2020 19:19:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s26sm1245138pgv.93.2020.11.19.19.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:19:00 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:18:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Peter Osterlund <petero2@telia.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Bruce Kalk <kall@compass.com>,
        this to <linux-input@vger.kernel.org>
Subject: Re: [PATCH 12/15] input: mouse: synaptics: Demote non-conformant
 kernel-doc header
Message-ID: <20201120031857.GR2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-13-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-13-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:02:01AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/mouse/synaptics.c:1781: warning: Function parameter or member 'psmouse' not described in 'synaptics_setup_intertouch'
>  drivers/input/mouse/synaptics.c:1781: warning: Function parameter or member 'info' not described in 'synaptics_setup_intertouch'
>  drivers/input/mouse/synaptics.c:1781: warning: Function parameter or member 'leave_breadcrumbs' not described in 'synaptics_setup_intertouch'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Peter Osterlund <petero2@telia.com>
> Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
> Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
> Cc: Bruce Kalk <kall@compass.com>
> Cc: this to <linux-input@vger.kernel.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
