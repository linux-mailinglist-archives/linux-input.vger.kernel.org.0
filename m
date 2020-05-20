Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F060B1DBBD3
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgETRpX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETRpX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:45:23 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89033C061A0E;
        Wed, 20 May 2020 10:45:23 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id a13so1633523pls.8;
        Wed, 20 May 2020 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EfR9abvjfYeSu2gOpoQjslxf3ylmODDyibdHeuoKSnQ=;
        b=rDM3xe4KWRWQelmyP4mTMwjuh5WmcZKYyi9OdmrfaHaiMOlYmooQGnpaYtCXHNPajQ
         ORm3rYGv/4HJycjjBwwXtqsfTRX8DMCklSJLc9zopKuEd4xBWHkKET7AHqup+f2XljkX
         twAisaVxkFmULfNTWrEZjING2pUJV9yUN9oAz8eaeOduFQAAmfXQ1Pjg8zPe0zeQ3Uct
         O00+cmAHfYnkFwePomPWLWI32kqeraDbyhpnJzMXv6ZuKk6KBdhkWBevjXu+FQE9Vauo
         fJuWYc5UeJ/nd4uwj/W0pGAuq9aN8uMFtGeNrC7oIcYQB06drPUBF62yoMTZY17Qly9c
         t7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EfR9abvjfYeSu2gOpoQjslxf3ylmODDyibdHeuoKSnQ=;
        b=JsB45+GXzKCFupRXLFO38yjiq2drDToQSBsRatSER3ZHWlXLaLdEGJxK7AsdSHcaQz
         Ia5JMKYwBXw4Q7hiQnfqCXlJccyuxEMLR5wnfcxZenf5JYBl8gntVIiUPnYi9EJILTAf
         y6LVvS1kvcLtjunXybkfFWi4Q3ppugavXpt2I0gqyyiHDjJmlWnwbK4PRg/CTVWzEDrz
         ULExHfe8EnkP7R1LhIn5i/vY0UMgywCVRoXz3TzTQH/+3bazF24obZXqFk1yydWB02ki
         riyDmHYBlXyzG9r6L2O8PXq3DBJyEMnfw/Vv4Glb2Ex4gsLYDcySehgEIVZouseQItQ9
         v+Jg==
X-Gm-Message-State: AOAM531f0fOu4MAYsh+ZGnjqaLyBCqKMY14BeVwky+ZH5MVcpGvo62Oe
        bMHcpx7wCeDN4NLaaCcKpnU=
X-Google-Smtp-Source: ABdhPJzrOkudsfQf+69YBmDSRfXR9PAXhMkEirMBpWL46zGbjCeXUra4Lba6VD4QyXcCjlZGm9CHxw==
X-Received: by 2002:a17:90b:1288:: with SMTP id fw8mr6605137pjb.160.1589996722085;
        Wed, 20 May 2020 10:45:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m2sm2506053pjl.45.2020.05.20.10.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 10:45:21 -0700 (PDT)
Date:   Wed, 20 May 2020 10:45:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 3/5] Input: EXC3000: add EXC80H60 and EXC80H84 support
Message-ID: <20200520174519.GV89269@dtor-ws>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520153936.46869-4-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

On Wed, May 20, 2020 at 05:39:34PM +0200, Sebastian Reichel wrote:
>  
>  	data->client = client;
> +	data->info = device_get_match_data(&client->dev);
> +	if (!data->info) {
> +		enum eeti_dev_id eeti_dev_id =
> +			i2c_match_id(exc3000_id, client)->driver_data;

I believe i2c devices can be instantiated via sysfs, so I think we
better handle case where we can't find matching id. Also driver_data is
enough to store a pointer, maybe we can have individual structures
instead of using an array and indexing here?

Thanks.

-- 
Dmitry
