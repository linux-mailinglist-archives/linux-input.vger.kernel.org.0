Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69F94247A2
	for <lists+linux-input@lfdr.de>; Wed,  6 Oct 2021 22:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbhJFUFv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Oct 2021 16:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbhJFUFu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Oct 2021 16:05:50 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 452F3C061746
        for <linux-input@vger.kernel.org>; Wed,  6 Oct 2021 13:03:58 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id s11so3437678pgr.11
        for <linux-input@vger.kernel.org>; Wed, 06 Oct 2021 13:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=30daCH5wxIaUmgt+ry1MQbFbMl+0NXX1vxJ2OHYX5CA=;
        b=IBil/iyiEA+iDIRqiGc88wUVlsgGg7lSQJlFlVv9YKyiRva4baKXXVg/U2Q/GJkrNG
         vLm9icwX3W3Q3WsW8jmU01vR211TCnD3kUMvvJGbBZu/8hP6JqDJNUaEpeFOZIf+0oES
         Dx3qP+Frd8MLWJRIy6Xi6JvieJ1JjWOcS24hDYFTKEwicHPx/TdiooG1Cw6dznhXkFoA
         WMbAW++4IbAD8IWiiP2sRj+H7lMwUUuS4opmxU70tAf+NRixZL3BLPQkJ9bwvLC2EPSb
         zOd2ElnnjrEalq9hV0nbNMkod30RQI6XI3UfORjZfu/qIT4Cr6SXAC2+5vqhmhd9uOaX
         PvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=30daCH5wxIaUmgt+ry1MQbFbMl+0NXX1vxJ2OHYX5CA=;
        b=S2zqzuZZG/zuoWnGxPm79N8Z5jE3Ml75cPTuMflTjDWx6/aTEp4yotZEWVfsWeJIR/
         TWXXmJJJMIfEkkJh30HoHeCOd7kzcykysm7vSLBt6I+jf2Xug8slsuY5kdSX60G5NUJL
         h4hqgv/07q+UUWHO1YS1v4Sj1nZwPS/9cZOVODbPJ1KLASfx/zxfkiGEuxXMNNXAfSOf
         uiiRYGn/kwkPgG7ACVkCglAPlxAW6gGg1toWa1h2vmvtQOu6dt72DpMKOpP9mSETOJvg
         lC8aMoufT1h5dtgqS45yfIh/P3qqri7jgoxkEZbzJkJqBwbDb/3HR6AFKM0c47AjoesB
         n4vA==
X-Gm-Message-State: AOAM533fygdWp8rdB9Go14Ijgl9G4cla91O0oxBkvUaTnjCw09MhRiMS
        huiWaQRIyPmYi2sOZRpmGwE=
X-Google-Smtp-Source: ABdhPJzEKOY2feV1Dc3Ooe+778RBORU46OB2A1MKg4SXDmFIBohf0PPVo8rkwpqLbD5uYDyx9dZrAg==
X-Received: by 2002:a65:6a15:: with SMTP id m21mr2416pgu.415.1633550637531;
        Wed, 06 Oct 2021 13:03:57 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:18f1:d20e:edb5:c807])
        by smtp.gmail.com with ESMTPSA id y197sm19604576pfc.56.2021.10.06.13.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 13:03:56 -0700 (PDT)
Date:   Wed, 6 Oct 2021 13:03:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] input: keyboard-matrix: add a function to reset input
 states
Message-ID: <YV4BKqLSVhMuxOeP@google.com>
References: <20210926151847.337767-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926151847.337767-1-angelo.dureghello@timesys.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angelo,

On Sun, Sep 26, 2021 at 05:18:47PM +0200, Angelo Dureghello wrote:
> In some cases, at open(), when matrix_keypad_start() schedules
> matrix_keypad_scan(), some events may be fired, but they can't be
> grabbed from the event queue by evtest later on, since this
> condition causes a continuous event triggered.

I am not quite sure what you mean by "continuous event triggered". Could
you please explain in more detail?

Thanks.

-- 
Dmitry
