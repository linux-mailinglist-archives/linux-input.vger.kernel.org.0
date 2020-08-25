Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14699251DD0
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 19:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgHYRH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Aug 2020 13:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYRH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Aug 2020 13:07:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B79C061574;
        Tue, 25 Aug 2020 10:07:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z18so1580284pjr.2;
        Tue, 25 Aug 2020 10:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mRjZvPEzTfbfzrXjGveM7zQ3xu+YHRq2yS8IAEamwSE=;
        b=otzCWeByV0AuhXYZqgJ3P2yJaWWLdWjAt4j1h3rf3XFl+Fgiz/+F+7Z2dVlI3XeLRN
         +wrBl2o069yyTLJIMPEalo9TxE1IMFeORtLwwA98kW5NvD2r90P12VXlQiqJiz308zc0
         FAsyFDyCHfzNoYXje7rOuuiqtRydzoke1iiXxZWe7n7/T2sp2WSqjV7jWGXKR7zXz5eq
         Wqik3Of0DPia3a/pI+peNbVA1j+evyyZJyka0NW/DfNVFgCnj/Mqf+WWtive3u7ZhwoL
         9BGJFYDryUsTOfYZwX+QzqBiBXcJUPFcXGdFHXJYZFGv/pO5NIFaSEiSSTcSQ+MNgylE
         Jk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mRjZvPEzTfbfzrXjGveM7zQ3xu+YHRq2yS8IAEamwSE=;
        b=lZAcXl781XL7fcSfMbPXog38zw4TrCcgyU3G6oJ+ugZVfwyi3G0YJEcAxulWRsP7ZU
         tgCswEEcDAS96nK50v8udUQagJChiyjJ68+FU6Jjk62/5adQPsmIWsOBV5iyWNBBENcA
         pDraV9/a3OAbL5HjrW3JZYCoDgQX9s045Kh/240BkJMbh2HYWHau1tBjcVaTyOlyITQK
         sPJMQLYmJ1H5DR8o1OGBnIevT4uK6b0qIi8gRyTQ32pit7vo4eIsfzFx0Xl4NaZFiNCv
         WW8EAaPx0SR6AotuhMBSD7asYXGOVO4vXlQtkUqUjJbKjIgkE8AkdpQccX4JJIOyCiyJ
         aIEQ==
X-Gm-Message-State: AOAM533x2B5x0I6UchY1ulmQz1n8sWIrzw05cSAR4qGdYBvxxRlaEyL1
        h92JV8qbQu97/U0RCkaWq5rKoXpLnfY=
X-Google-Smtp-Source: ABdhPJyl+ifCcH+O3xpNTGY/GJQsxcDP1uTn2BjMwkU5tyxV0wvYZIa6RZmNlx/VtGqOHr+9v7oZJA==
X-Received: by 2002:a17:90a:c781:: with SMTP id gn1mr2332600pjb.151.1598375246221;
        Tue, 25 Aug 2020 10:07:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id mw8sm3113769pjb.47.2020.08.25.10.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 10:07:25 -0700 (PDT)
Date:   Tue, 25 Aug 2020 10:07:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Jiri Kosina <trivial@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/29] Input: MT - Avoid comma separated statements
Message-ID: <20200825170723.GZ1665100@dtor-ws>
References: <cover.1598331148.git.joe@perches.com>
 <02cb394f8c305473c1a783a5ea8425de79fe0ec1.1598331149.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02cb394f8c305473c1a783a5ea8425de79fe0ec1.1598331149.git.joe@perches.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 24, 2020 at 09:56:09PM -0700, Joe Perches wrote:
> Use semicolons and braces.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Applied, thank you.

-- 
Dmitry
