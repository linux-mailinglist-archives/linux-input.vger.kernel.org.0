Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F0936A4EA
	for <lists+linux-input@lfdr.de>; Sun, 25 Apr 2021 07:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhDYF1U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Apr 2021 01:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhDYF1T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Apr 2021 01:27:19 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55BE9C061574;
        Sat, 24 Apr 2021 22:26:39 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id s20so11399937plr.13;
        Sat, 24 Apr 2021 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=19YsI2OqhZt9KEbpFpml+1pJ9ZHBS+ua43lgOkMfsQg=;
        b=oiWrSCpIoilmatpR0so5WVBBMJMqP8RNXEH2Je09KW3JpMx9NxgR/DoNV20yewWNdn
         FxXz3kUzBF3/Ukw6g/vlNdGaEB78mjSZmMwDZHq8o5S7nB4zrRAYyT4R1w9JO6pvzuHw
         LZAoDZkG3MPQKajP70I82W68LnI5Oge3ImD5BJ60bULLebmN3YqgBZnvalaEI8nW/0yZ
         tIVbRCWjTy7Q0WtO1q6X6asGddNsN+e0YEunZ4f1oWZN90bGtqEK4ybgeZzWLyZhpdUd
         1+BvJm3qPpBj/RYp6D0BnD+r5tnjJ/LGm7JI5SUIIMq5B9i2tpRx4Sjsl3NFKJf4cA2B
         MhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=19YsI2OqhZt9KEbpFpml+1pJ9ZHBS+ua43lgOkMfsQg=;
        b=jn77wz7pi61+zGinq90FZjaYIj5Uo1PQr5t9ntZFuORFN2tbJN3KI37p5BkiURkqS2
         BNnSYJdR+hzpjaDoSPZWQ5axAg+xRfMvw95e7ySxQRxlo4AHX008hJcfg7aSUlFhzNdh
         4saMg/lya6dPkWy5PSPtigReZHg2g4ew7Ulk+8kmN6ko6QD4dXdp88vcCrEbAJEL8DrR
         fC6HOzye+z/ikNun/teJpDPdiuI7FFjWb33HgFzJ0WgXhI6y1revMum1WmMgdfe32svQ
         wqEAIpw9OGnHgtrgHzZ4SormNm4/cR4077yBye+29lFf2DkZGCOw1qtV9GNu1TS5Ds78
         Oiug==
X-Gm-Message-State: AOAM532O+KvpGB4JyXJ2UVghN+DJiBE7U4o0Tp4vcNZq0P3/lPywsd6o
        MkWdkGgl6dH/+iN/JrHtg60=
X-Google-Smtp-Source: ABdhPJzWwnojpPRkg2QjfGOOgyYVJrnA5PdWNgDvnc7QMoMK+xr0a6LXpiS7IyFzXysQxlVvmN3Y+A==
X-Received: by 2002:a17:902:a9c7:b029:e8:de49:6a76 with SMTP id b7-20020a170902a9c7b02900e8de496a76mr12442662plr.63.1619328398798;
        Sat, 24 Apr 2021 22:26:38 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:28b7:b656:4f0d:6473])
        by smtp.gmail.com with ESMTPSA id o127sm8334834pfd.147.2021.04.24.22.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 22:26:37 -0700 (PDT)
Date:   Sat, 24 Apr 2021 22:26:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: evbug - Remove an empty comment block
Message-ID: <YIT9i1EWlq5hks6Y@google.com>
References: <fda981546203427a0ac86ef47f231239ad18ecfe.1618520227.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda981546203427a0ac86ef47f231239ad18ecfe.1618520227.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 15, 2021 at 10:58:16PM +0200, Christophe JAILLET wrote:
> This is a left-over from commit 1a59d1b8e05e ("treewide: Replace GPLv2
> boilerplate/reference with SPDX - rule 156")
> 
> Axe an empty and useless comment block.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

-- 
Dmitry
