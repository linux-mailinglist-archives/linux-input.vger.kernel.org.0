Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217D31C95D6
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 18:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgEGQBo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 12:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726029AbgEGQBn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 12:01:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47340C05BD43;
        Thu,  7 May 2020 09:01:43 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 18so3198893pfv.8;
        Thu, 07 May 2020 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vq/DlfbSPyVVIVTh/o7/6qUzLWtMfyqE8W9dYn39NuM=;
        b=R8HKj6DxTc0LO9F+Pw7CqV6hlQyRjBt4v65MoFsK1Cmz0TxVccLPJY6pSQooudqnK8
         MnZJ+q1lMvlV5fE9Kt5Z/z92WhK41OVHWalgSZiTk1zNdJprnZZaYFbzloCnu+DhfxHv
         FocM4isWUVHi1F4CTvvIX5z/QOTqq10F5I5IjWWO24scb6Rc9Y5zNaJEJYUKC95c5rDF
         BNoAt+k8LClIZJ7LXnnfbyz86dye0lnXFc9oQQM64jDJzIhNbOT+wdYHR2eLLCLDjCsQ
         H5iZtpS/3kvje1GhQ/Zy4iDv//XIQS7hkBDQmwEkkL03zOW6y4Nfz5OVOQdxQgO/5MWZ
         MFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vq/DlfbSPyVVIVTh/o7/6qUzLWtMfyqE8W9dYn39NuM=;
        b=XtEmu+HC1dEEXsYrBxnh/x2mW/15BFH067THFxnA+Ex97UbkXxipsjgshITIuX0+xV
         qXIJydEsav2jP5ZuqeNeVJVW1NT/rGMlmtMIqOo3RnBYreWlTgUXyWOb5duAxX+gbNv0
         wo0goiyGogZo7DDLSsFLD2XnXDbwhUQVBdLUw2bN6HWOs+fsDHn69D9nuOVm2OsI7vgm
         CMCetHCZrnSzLY/nVbCn0a3oLqxGguhMt0y8BXbQZSNf3PRd438kWx9DmWjwCJBqBF1v
         zMukvPdnFVSTJaoKJzkm2UdqMm+tXx4xf843vW/EB18bYtWFDbAyA02zekSZh/MrI9pO
         l8ag==
X-Gm-Message-State: AGi0PuZ+DeY6xNbRzH+8zx4YiMcCAwwljgqZzahHenwkU2rNoGNKlQPb
        H3I416o8Qg7F7GggpaOWPqY=
X-Google-Smtp-Source: APiQypJmzz+qARIIR1x3MXcG9ZqL0GP+2xbEJLOhPc0Wmm2jy7FnS2cdlbujfCArT3WF9mGSg3GXgw==
X-Received: by 2002:aa7:8b42:: with SMTP id i2mr15117982pfd.21.1588867302441;
        Thu, 07 May 2020 09:01:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a2sm3984978pgh.57.2020.05.07.09.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 09:01:42 -0700 (PDT)
Date:   Thu, 7 May 2020 09:01:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: stmpe-ts - add missed input_unregister_device
Message-ID: <20200507160140.GH89269@dtor-ws>
References: <20200507151213.792640-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151213.792640-1-hslester96@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 11:12:13PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in remove.
> Add the missed function call to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
