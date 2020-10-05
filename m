Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB332842F9
	for <lists+linux-input@lfdr.de>; Tue,  6 Oct 2020 01:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgJEXfE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Oct 2020 19:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgJEXfE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Oct 2020 19:35:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21BCDC0613CE;
        Mon,  5 Oct 2020 16:35:04 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t14so6923903pgl.10;
        Mon, 05 Oct 2020 16:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XkgmFdF7iI1gr3niP5U/zLfBpTvaRznfruI/h62CcBg=;
        b=APgQPusZVhUfZen3mW0vDWSugR4fCD2EYJqHn4vA0UPIz7ekBt/8fNCNsU08GHUX9o
         DlFSTqeLmv9s3ZlFLymBfIGlCwUOXlhgYMZzkxZVitrJWrafIN4BtDHV09FGQj5+Ub8M
         M/N41ULrJmnVGY1/+4dAhN80rr60acAOD8NAih4MD1zMHwgHLVA8XPqtibuyyI2tVWLi
         978tqcUylnk9PQLTLF8KaIUEBW/cONCg5RwLrGAFy8N72gjLWfyQx5KhL/ODi7CaiNIx
         9YMFQHTURIKvFXmhoQZeQ2jGQ6hA3uG5PidGoXqnB6zTsAKzKnHgwS9J0fS6ZWmXRUSh
         swZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XkgmFdF7iI1gr3niP5U/zLfBpTvaRznfruI/h62CcBg=;
        b=LXqzo+dVoMwHEir7u7uA6skw3FEWMMvP5kXjkr5vZRp5sOrJHRwSltyG9N/rnJd8qL
         x0BI/CEBya3+A8yVrijw3LH/v86jARySAmQ9PhDLVRaB7r8+3oLrj15G0dP4pLPmbdAZ
         W8w1Y2Df93rhAJaVEKTP4gVVYQYvOSYCJadBUxP/t/vdRQfXD6xXnUbv2pokBsH3df5D
         F9iFIsGiZzfwes6vcknvzcBmwxFl3JCjKXeD0a1thtk4eqhp/ALcyv/QrnGmqWkv8lTH
         jccq03pebpouzyc7IVVbkB8iJPjpI8XUPtMQWW9Hfeilq4jlbxuqh24EQJa+Q82pWo1t
         /K+Q==
X-Gm-Message-State: AOAM530TLyhbbBvYXjvGC9ikKGvWpR1AQkQe1l3QlptazBKS6hj9XAo1
        GuiWdkLbz2ev2hlEdZbA7kk=
X-Google-Smtp-Source: ABdhPJyu7zWZPrZjXn6mKPaD/Fue0XYUMdPpJ8dWRtdFDHNQJket7INrh404/RFdwpru7nulwIOULA==
X-Received: by 2002:aa7:971d:0:b029:13e:d13d:a08a with SMTP id a29-20020aa7971d0000b029013ed13da08amr1870528pfg.33.1601940903491;
        Mon, 05 Oct 2020 16:35:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q6sm1144427pfn.10.2020.10.05.16.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 16:35:02 -0700 (PDT)
Date:   Mon, 5 Oct 2020 16:35:00 -0700
From:   dmitry.torokhov@gmail.com
To:     Kenny Levinsen <kl@kl.wtf>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: evdev - per-client waitgroups
Message-ID: <20201005233500.GM1009802@dtor-ws>
References: <20200429184126.2155-1-kl@kl.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429184126.2155-1-kl@kl.wtf>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kenny,

On Wed, Apr 29, 2020 at 08:41:26PM +0200, Kenny Levinsen wrote:
> All evdev clients share a common waitgroup. On new input events, this
> waitgroup is woken once for every client that did not filter the events,

I am having trouble parsing the changelog (I think I agree with the
change itself).  Did you mean to say "this waitqueue wakes up every
client, even ones that requested to filter out events that are being
delivered, leading to duplicated and unwanted wakeups"?

> leading to duplicated and unwanted wakeups.
> 
> Split the shared waitgroup into per-client waitgroups for more
> fine-grained wakeups.
> 

Thanks.

-- 
Dmitry
