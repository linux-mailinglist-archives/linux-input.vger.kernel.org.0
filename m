Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CBA2A1BCE
	for <lists+linux-input@lfdr.de>; Sun,  1 Nov 2020 04:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgKADoA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Oct 2020 23:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgKADn7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Oct 2020 23:43:59 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A58C0617A6;
        Sat, 31 Oct 2020 20:43:58 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id p17so5028026pli.13;
        Sat, 31 Oct 2020 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RWhh4AQGtQyXAUal3s0IPj8u2MkPIp06XrwZM/82Xxw=;
        b=U1wTGLVBrtlrgIg9PT1MmTn9ya3aoRmHPdf7g/HsLoAMzNTCq+v2aDGxLHggEkV5TB
         w/keIsdAm88YFZ/RF0oGKGwhitRBV9UkvGAXKJ09WjA9yThNbd5UEwMl1JOGnHn6YHcd
         nBQto2zCAxcJU+IUEuMp9JEBCOgCDm5SU+TFQuyFq89yjJVTU7koDyEZaoluU92OpMEi
         fodCQVSJH4sNBdxnK2h3auwYZNFC0dUHVX8o1dmbs2aReGOBr9z9NiEe4gthR8fbEljH
         xiUSVqCcXyxBxlxL0C1RqMDwwddBd5s6p3Xogi/2wWXuF58xV+t3OvgB8g4XSNnY2nyS
         zK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RWhh4AQGtQyXAUal3s0IPj8u2MkPIp06XrwZM/82Xxw=;
        b=R+3tN9G9EI2lNowNhyJ8AGoFkZYZ+9wQN/9PvV9Qzz+heccv4MUA78GhAENE1It/Ur
         yyX6Ka5TJePJMOK8T/X7x/zvdYMXQTsi6KVlJRWa/7hoOPEF3XX8tBRhpuNoTNPb73dZ
         0Gsaw5tXu5SaquG8zUC6dzZZN16lcUstCyyuJ3RBoQJ7WbsPl+kN1G3U+NN27KHbShy9
         g6CVzol12DLaeQ52RFC34ZDTSMQApwGZjszJTGTsn/OdQIgiLdh0V9vaXy+J2VWb5sgf
         eP7ypiYFFj/gegRRkk1kT/Yhu5KKQtWVnotAlbiPLTdK7zKI+DiEuJc/v875OfTpJShC
         ozYw==
X-Gm-Message-State: AOAM53318f1TuX6Iql/IdSb0u+iappg4//PfXC9YC5Ty+tzR0b5Try5u
        aMPNOJLz053qsrJLJqPK3OE=
X-Google-Smtp-Source: ABdhPJy1g0+ZPdQfXjE4aSqe8H4vdpeG9uW+GdWGtJCpMPJBm55grn2tfClL8W+Tsj4wcovxgwdryQ==
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr10620694pjs.181.1604202237306;
        Sat, 31 Oct 2020 20:43:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f4sm3139860pjo.29.2020.10.31.20.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 20:43:56 -0700 (PDT)
Date:   Sat, 31 Oct 2020 20:43:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 31/39] docs: ABI: cleanup several ABI documents
Message-ID: <20201101034012.GH2547185@dtor-ws>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bc78e5b68ed1e9e39135173857cb2e753be868f.1604042072.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 30, 2020 at 08:40:50AM +0100, Mauro Carvalho Chehab wrote:
> There are some ABI documents that, while they don't generate
> any warnings, they have issues when parsed by get_abi.pl script
> on its output result.
> 
> Address them, in order to provide a clean output.
> 

...

>  .../ABI/testing/sysfs-driver-input-exc3000    |   2 +

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
