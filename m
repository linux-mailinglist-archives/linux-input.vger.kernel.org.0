Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AF41C95C7
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 18:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgEGQAP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 12:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbgEGQAO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 12:00:14 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B27C05BD43;
        Thu,  7 May 2020 09:00:11 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a5so2820040pjh.2;
        Thu, 07 May 2020 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hIkY+Uh5gMlLmSJBfh/URGTav8SCaaqStV4OKfiYn70=;
        b=BFY7Bwwqf5SWIF5p9IgbjYkYbTskcnxuSNyvyMq4bZQ/+YlOeZQ5nxRLzz2cPiLZ1o
         LV9Qc3q72SQkCvfvP1d4Dgf5NJPzFTkGUyKqnlROewCuS7d9QQE0w/mgvcDzmzSFjA3Z
         WqbTiXsKXho//LKC/tEKgUSV/hMuodJiJ7AQWe+CqJFC7E1ASt3Bt/DHQ9EFYtG+ReL1
         D9P4AQtPzhtcuy3vpCSCEzt1p6XHBnJ2oaZ0WSz8wnltKs7Dtieztl08cYTwwvhmL/1g
         xSR9GynjhBjAcBJETUq1VgxF458Ui0UqQV5QzlCr3NyA4o/gFedbJnpxJKJbzgjc5Txy
         IYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hIkY+Uh5gMlLmSJBfh/URGTav8SCaaqStV4OKfiYn70=;
        b=PzzZnNn+D73DycLPiOa77s+nRJRBbG01jOQxq9PRLYgJ+AASFOo/yVvEeFEB1SCT7m
         G1dNEjKDlrfIu8wadjqO47rfHgSpFjzj83jb9IWB24FDaLQAGMh0PwsXrZFLVjWhQcfz
         6MinVQV9d7zqdKmOU7IVkvNlajWNoEAdxbT8BVpZ/NOmPyDHOidbBwnwOJlcjmy3uMqx
         EuERBB2gvj7/aaNogUx82Zr7L2DHxT/PgviR99x4m/9G6NESY19pCcfuEpFEnJnnfcwH
         AA1WqPA3aXD1tqNHd1oJtv29tnkvEPpB+0CXJFuN5yulqJ6a7zUdIdyT89AWCDjJysWH
         pgsg==
X-Gm-Message-State: AGi0PubU4BS1OdLOVn4HySp5DTVgODGEqlTfoxb95JB6kp1w1xhODUcL
        9ko2naUPoWXJ7f98J+dbCU8=
X-Google-Smtp-Source: APiQypKNGu23Cw0TMP2hLlPw/m++QwuOUGrqiThsI0IWpXQvl6qKhiP0E8gr2yXB6saCvXX3mRpQdA==
X-Received: by 2002:a17:90a:ce01:: with SMTP id f1mr829590pju.166.1588867209967;
        Thu, 07 May 2020 09:00:09 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id w75sm5194964pfc.156.2020.05.07.09.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 09:00:09 -0700 (PDT)
Date:   Thu, 7 May 2020 09:00:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: applespi - add missed input_unregister_device
Message-ID: <20200507160007.GE89269@dtor-ws>
References: <20200507151041.792460-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151041.792460-1-hslester96@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chuhong,

On Thu, May 07, 2020 at 11:10:41PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in probe failure and remove.
> Add the missed function calls to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
