Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24651B12A8
	for <lists+linux-input@lfdr.de>; Mon, 20 Apr 2020 19:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgDTRJf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Apr 2020 13:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726296AbgDTRJf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Apr 2020 13:09:35 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF7EC061A0C;
        Mon, 20 Apr 2020 10:09:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g6so5354015pgs.9;
        Mon, 20 Apr 2020 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oGqtpyrEePYxWV1yvaPlc+oStlhcDZxwsYxCHpPKFI0=;
        b=UfHtJ++fowlpsq/0H7ghGeV8rsUVqv0/BKPIZZyri5E7/EUQF6XEHFd8K+4c17d4dy
         C8kRmy/2Bwre7U9WXb+/fkxdvXrkDJ0k1UyyO4TvmpnNEGOh6hAUUD1j8YlYmr8rjf31
         +NhmspOMowcvfYcKMP6Sk87shhQQRGi+xgjMVz5vKNCeNTLuAdl53ueIdu5nB+k8/xIg
         gRwW4+04QO4SIh26Fl0uZENFY9Gg7j68ncxGjTQQ2k8DRe7j/oLdUeQOrtX69AxSCCKs
         NUOo5TqscV/yIfiz5hDozG5ftmE9UJd+spJ2CN+mC+PnBOs+27aEK1DZcsTHIgNEOXhE
         sDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oGqtpyrEePYxWV1yvaPlc+oStlhcDZxwsYxCHpPKFI0=;
        b=cQuW5OEOUc0inDirpTk2oicFqZ588QcLUpeqrjv6aTiZaBhsFl+8lmWwKSaj6+/EMB
         hmljEv+7Im3KVhvTk4BxLR8JK8X/iEUvJOjMNHBnEOVOt7xZ0vWf7pkTDTMYlhLlAuom
         xLYAxGqVAFx5ZC4TsKMhFpp1bHoUF7UzgXwDebQAm6aqSbFFwe9EfNyUnsy3Z8zqwY06
         5qo3rXtKcea6TnjYoDlXoeNsq5oIEa8fPxBkBJVLSqwg4dcqjBcpxZxRS7w1YcwBw9Gh
         VAf5GQg6qb8gOU7rVnMrIqS9CxyoXk1UqiTa/0CvOeElYF9/kCXt017OVPbJ6pT1QaNz
         /nSA==
X-Gm-Message-State: AGi0PuYrgoWopbD+8YtonmyAG3QcDPenzUd2+XSBVEv+AqhNWcW7vEKy
        CKZibRVWLXdkunj5iKv4nYg=
X-Google-Smtp-Source: APiQypKonnkcRsFc4iqkPXgRs+P8IPPV2hkS+jqMqm39F08ywnDqrN5ZtBi+f5DH78DIeELtHKG8Bw==
X-Received: by 2002:a62:58c6:: with SMTP id m189mr17359302pfb.161.1587402572992;
        Mon, 20 Apr 2020 10:09:32 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t23sm169730pjq.27.2020.04.20.10.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:09:32 -0700 (PDT)
Date:   Mon, 20 Apr 2020 10:09:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] input: misc: Add support for Azoteq IQS269A
Message-ID: <20200420170930.GO166864@dtor-ws>
References: <1587340068-2818-1-git-send-email-jeff@labundy.com>
 <1587340068-2818-2-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587340068-2818-2-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 19, 2020 at 06:47:48PM -0500, Jeff LaBundy wrote:
> This patch adds support for the Azoteq IQS269A capacitive touch
> controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

This looks good, so just need to get Rob's take on the binding...

Thanks.

-- 
Dmitry
