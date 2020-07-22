Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1AF228FC0
	for <lists+linux-input@lfdr.de>; Wed, 22 Jul 2020 07:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgGVFeo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jul 2020 01:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgGVFeo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jul 2020 01:34:44 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20393C061794;
        Tue, 21 Jul 2020 22:34:44 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d7so379980plq.13;
        Tue, 21 Jul 2020 22:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CqQzl9x6CoNQH4iSZy7+drapjLq7r03O/hTWPhkbmb4=;
        b=jBj9pV2JBo1eQC4Pxy7mt7cRao9xVS6pBABuAGtx89kVOr6edNorEOc8C2Z94b/n5u
         Z8cYB5NKkngbVdtg+REvUON+ZiTBbTp5NU5I/tdcUMj3UQkY7aU4axCn3P1KZEpTOKYA
         hfMpuLWXb+ZRbYzImoCAmUUv0LnbIx9+m+RtnE7YZCMHze+zO7/Mn546BDWIAiaR7rie
         tGJz2ji3XlT1hPbaqAcFoMTUY6WaJNPCTeI7h3WtLnleb3e60ZTnaqcMLwU7myR3J+VG
         uyaSmsx+sa5BBlVNtNDegtTEP9j/qb/GZ3tjLfRpHG3/LCrWVXpgDcJAycF8qD3CRIDu
         7H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CqQzl9x6CoNQH4iSZy7+drapjLq7r03O/hTWPhkbmb4=;
        b=K9/ClYeXoEt8CgEX4s+fuKwWR6jLbMLv2r7risfHKiO2HdLEgmMHs+tGONfSsTjiq4
         ROwjsdtn46sOdNLuHGoNgktFkdnS5GSt7QbUGWGULKmYxqg0C05FnE0MEFplevOJVkx/
         pMha69uLAbfLai5+u+oSO9DpuJ5zEPC06EQka5zSDrk60J3H3eX4mqSfxzCmtPOgivyR
         huOgzubWsAyQitnR2aordB3ZW62TUBO+1y6DlJ4u1VkpeHTF5q9t49t+hyIY83FD0JBM
         kFPdeYgqSFqnPndPqmqs2lhTsI/rbdUXmfC1Up2TKbDBP/Rtp8oWqGcVeSrhcoKIhy+Q
         YzwQ==
X-Gm-Message-State: AOAM531O60g/ANF8+5vzOk/C4ruYbEXJMxw6UtmfnLT76/aU1xrxTatf
        akGyX4tuSHerW0mR0xCdMgD9Lqqfa38=
X-Google-Smtp-Source: ABdhPJyu+CzemnTp/p5r21Cwez2GpFQC9UPZTsSq0YHnO6GaMZIUTugw0PqCfpU/S3v+TqBrbl98lw==
X-Received: by 2002:a17:90a:ba05:: with SMTP id s5mr7648643pjr.132.1595396083459;
        Tue, 21 Jul 2020 22:34:43 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id r8sm22358883pfg.147.2020.07.21.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 22:34:42 -0700 (PDT)
Date:   Tue, 21 Jul 2020 22:34:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: psmouse: add a newline when printing 'proto' by
 sysfs
Message-ID: <20200722053440.GO1665100@dtor-ws>
References: <20200720073846.120724-1-wangxiongfeng2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720073846.120724-1-wangxiongfeng2@huawei.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 20, 2020 at 03:38:46PM +0800, Xiongfeng Wang wrote:
> When I cat parameter 'proto' by sysfs, it displays as follows. It's
> better to add a newline for easy reading.
> 
> root@syzkaller:~# cat /sys/module/psmouse/parameters/proto
> autoroot@syzkaller:~#
> 
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

Applied, thank you.

-- 
Dmitry
