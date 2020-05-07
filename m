Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38F81C95C9
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 18:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGQAo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 12:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbgEGQAn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 12:00:43 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB713C05BD43;
        Thu,  7 May 2020 09:00:43 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k19so2219144pll.9;
        Thu, 07 May 2020 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uJvtfDwR7qzmQPyziXVeIocKBLvNDEV/Iz2xTcRy/tU=;
        b=AMulUysMEg6hUwHgUIs2fWsKY+rSYJP7Lv+v7HFyQ0m/LujrEZHbMRHhUprUiNL+Y3
         oMdk5ynqubTf1lVdj4AI0O1uN1jQ51NsM94IRpGfq52srWmiVRh4qZjIb+2zh9o5wyTP
         Bj2zFg26mMg7j99vqlKxTVGhy2gw09PPnaUdxJY/Fjc6jIGU9LAwlLWFrW8TPGGghUYO
         35EQ+Unv+5mbYmXH87QuI+jGC16EeLPZxX+UJOexr3RjlsH4vTn2+B0AMmAtz7BJDlz/
         BurCH5Ua4KWGNoFgyLzz1AjxD/ogvaywP9ibJ26GrKJ7Bi1HuNsJO5KuwQHAJXu2ZktX
         6YMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uJvtfDwR7qzmQPyziXVeIocKBLvNDEV/Iz2xTcRy/tU=;
        b=BKQZGesA63VOoATSr5jF7IYYEgs9z2tJTuzlUDeENt6qRprZw//1wMnIsR789A3GKM
         HBGTczUI3ZfxXKergdZRwBaDMPHCN0HshbaTDRL9x24qPPy4X2ZTWZSKji8gNI1RKQys
         7UMpFLBTGLqe9GDxcoFDrwnXGknyHAY3muSohs/rbWhvVs8PyWznq2dKrVEzRYaCx15J
         JjXngOJe0inE1qgL/kKGrSor/ZMKrQE0OJEkBIlLrLa3mEAcZYsCGzv9M4bl9yG0OV8Y
         eecHtp31x1ZtarscSzknajHKKdHo7QQJPvkSLFJZZhsRvIRgR0J++mTKOZqeXRQ7ZJZ/
         Maew==
X-Gm-Message-State: AGi0PuZ9Dmni4AX9vMtiBrxCMfSkGGI/qD9aaooAjCrSlBDy5rLLixJG
        m5mv5vYNZ4wf1lerDDL6KUQOZ4Qz
X-Google-Smtp-Source: APiQypI+R9U8aCoEUJY+1q5dNDhPbLg7KvXVuVog/GqrXNrsh5vzWLuLTYwXHL7KrcKMm6f/BIhmZQ==
X-Received: by 2002:a17:902:6b8b:: with SMTP id p11mr5283379plk.134.1588867243062;
        Thu, 07 May 2020 09:00:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 135sm5198698pfu.125.2020.05.07.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 09:00:42 -0700 (PDT)
Date:   Thu, 7 May 2020 09:00:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: s6sy761 - add missed input_unregister_device
Message-ID: <20200507160040.GF89269@dtor-ws>
References: <20200507151115.792516-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151115.792516-1-hslester96@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chuhong,

On Thu, May 07, 2020 at 11:11:15PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in probe failure and remove.
> Add the missed function calls to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
