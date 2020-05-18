Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123641D8750
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 20:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgERSct (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 14:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728490AbgERSck (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 14:32:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB92C061A0C
        for <linux-input@vger.kernel.org>; Mon, 18 May 2020 11:32:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t40so229498pjb.3
        for <linux-input@vger.kernel.org>; Mon, 18 May 2020 11:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/mMR9SUonYE7Fv7AGmBuqnBhi0hTnr4y0aRcJNSvnS8=;
        b=azXlw+gGTIJPTRABWIGguF1poENMDxXOnw40erz4saSn0RIvCc2DIaKVfNiBRYX1c0
         zbmw5vPa4hP7DQuMSpZmYKAwibt185zJoNNC7L6/AAxJUrMILlUnJzuE5rTSyRxtNTip
         US7uFCRAEIyPofVKpEOG9DRZ9OFJ3mmIaSXEW4hZCBF8HwNUFolZ4aaLUQCxuhSrohd9
         JbaYKwaLdiuOJkzF91R5OUuJP+mCz8RVV5/9Ap10DLeqlIClyPfjaMa/fO0L6cTu3mnn
         Sr1Oj5d7CB6nytdW2k85ysevDZ3L9F5+kGUya/J4Ve6sSf7CcWioEFIC8kvePchVH+2H
         E82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/mMR9SUonYE7Fv7AGmBuqnBhi0hTnr4y0aRcJNSvnS8=;
        b=tQmrj1wwZ/YNUCtWltnb1IDtmPK4t77xYgMNwgPDOguQDnyBv86m+h1tAjYbR+QXXV
         t9KvFgy6h/jhUnC7N4VIgsGvUJUj1LkMbm1yapqdJTlEzSlw4QbQrzk/duOS59BM3DLY
         d6Vk2e6JBf6tubLOXC0VKKY2aIClbiuA/rXlrSUIUZvkw21RfayBFd8osObsJ5aOeNvt
         G04CryHebWUrZ/eTpRoxyG9w/BT/M9OILjNdPri7cuNF/iYglBrDlDwSBzawBND9M7NU
         hGLVpF+qgLOdDLOEYYSmUTMNWMHBnKSMDk91QtSRyNL6dgxHnt9d0cipWXBMlbwigcsN
         oJFQ==
X-Gm-Message-State: AOAM532AC2pHHrDWB2MrKmpmEU1LWdtMlx07H0ecX0cfKtWjpGhFRH6Z
        W1AOdbGr6WNfFqIAoAN58UA=
X-Google-Smtp-Source: ABdhPJyhq/EHlVrWbk91TheLtoN5re0VFSfclLwmmISCt62BBBrVtKOPF/ntWD0ELagn7clb3QsFhA==
X-Received: by 2002:a17:90a:ad92:: with SMTP id s18mr829114pjq.30.1589826758640;
        Mon, 18 May 2020 11:32:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id b1sm9317486pfi.140.2020.05.18.11.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:32:38 -0700 (PDT)
Date:   Mon, 18 May 2020 11:32:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs269a - add missing I2C dependency
Message-ID: <20200518183236.GR89269@dtor-ws>
References: <1589809466-22748-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589809466-22748-1-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 18, 2020 at 08:44:26AM -0500, Jeff LaBundy wrote:
> If CONFIG_INPUT_IQS269A is selected yet CONFIG_I2C is not, the build
> fails. To solve this problem, add I2C as a dependency.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")

Applied, thank you.

-- 
Dmitry
