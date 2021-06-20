Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09BB3ADD34
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 07:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhFTF24 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 01:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhFTF24 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 01:28:56 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C43C061574;
        Sat, 19 Jun 2021 22:26:44 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id k6so11050449pfk.12;
        Sat, 19 Jun 2021 22:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=huQAsXEHGYM8dN6CKEzTL/HHfaC9la4fXQalNTWszjg=;
        b=RT+favGTR7/DFdAwJaCu4mtSx/zjCUmZKMG5Mi+rS/eCnFkuYfdRKfe/ku3YzOv18R
         hVfQPKyf1YhWDvc12XaPJTw51VNCETp2wQcbiL4zlpoLPzNI55iob6m/bDUwr/nGEJM3
         eHIG5lM3e9/fOgkb7GMxf+E0WuB7jLBOZwu5of5/ykWvAmL/+xkoJzzHbTYf2r7erI3e
         mkK7DcEsE7cZnufWsudzoTKIiqaxPvQdH6sKe84tk+fnuQ8LJol34g2LlbPxW7JfJAl6
         dQmFQFV6PFxAFy/Ce/7QUqN8YwOYgpSZTVStVdiMqqHmBmn39nCVTpQo5IxFcM6gjqpt
         YS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=huQAsXEHGYM8dN6CKEzTL/HHfaC9la4fXQalNTWszjg=;
        b=uHlmvFgJcxsPfexyMtuV4zRjFukDyXOXNun8GPysynLL8sjUiLVQBW3RlvJwauPAq3
         4wi6BJJSu93yF7x1dvS+cPVOnvK552y50+8xkWT1j0WYCvzQ8lz9JJvi5CFz74A5l/0I
         m5i1TtlWjtlypRqhcub6vYxwYJ6RvKVROFVCy+vp9ZlbHBkaXTFYZr6sp1uAUIeDKR8g
         Zy9/yqE8wStI1ae5E4Qb8V2yy2iQ4q7yHghRPGS8l2IQ9RC9VAPg+s/tWkXppSKzfTyh
         4zu9aDnezUAmH7DFiPYvvUkD2aMPrHAQnzSqZk8REJ/NWLueRqK/Nl3dZ7hzZtFGPfKi
         TdIw==
X-Gm-Message-State: AOAM533zu2R0zzQa9epJ9afYc5idWTQdnR2CKt5QBLJoVHXtwi6/0QiU
        07Okq0PlGh6lLIhS5AejpWo=
X-Google-Smtp-Source: ABdhPJzOLK/12Uui+0zXPxqGcMeDu/wymHsDxVbZbSaaF/B5+SXro8uzptftaYra71tkoDirDfa1OA==
X-Received: by 2002:a05:6a00:1794:b029:2ee:c59c:56bf with SMTP id s20-20020a056a001794b02902eec59c56bfmr13351089pfg.2.1624166803697;
        Sat, 19 Jun 2021 22:26:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b83e:d8b6:9f4f:2be2])
        by smtp.gmail.com with ESMTPSA id k9sm13002101pgq.27.2021.06.19.22.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 22:26:42 -0700 (PDT)
Date:   Sat, 19 Jun 2021 22:26:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>,
        Anthony Kim <anthony.kim@hideep.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in
 hideep_nvm_unlock()
Message-ID: <YM7RkI8fvpkfwAGA@google.com>
References: <CABvMjLRxy1yqXUOWqTTeq=UOsLtuPAyOSCi4SPgcbAqjMuWCCg@mail.gmail.com>
 <YM7NzYgEl8NhU36H@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YM7NzYgEl8NhU36H@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 19, 2021 at 10:10:37PM -0700, Dmitry Torokhov wrote:
> On Wed, Jun 16, 2021 at 03:48:51PM -0700, Yizhuo Zhai wrote:
> > Inside function hideep_nvm_unlock(), variable "unmask_code" could
> > be uninitialized if hideep_pgm_r_reg() returns error, however, it
> > is used in the later if statement after an "and" operation, which
> > is potentially unsafe.
> 
> I think this is pretty sensible, but let's see if the original author
> has some comments...

I guess not. Oh well...

Applied, thank you.

-- 
Dmitry
