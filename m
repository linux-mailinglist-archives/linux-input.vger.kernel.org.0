Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41B12197E2
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 07:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgGIFau (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 01:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbgGIFau (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Thu, 9 Jul 2020 01:30:50 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BFAEC061A0B;
        Wed,  8 Jul 2020 22:30:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so370824pll.3;
        Wed, 08 Jul 2020 22:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hgH0s8PPXpzC+u6KlQUY0OheSaLFAPTeW98tNqYnm3U=;
        b=HOxiNM1ARlxshyRYYVhTy3rNVffABjy6YgB+s3BXI/Yw8YfTPqNd0ys9DynUnaqiml
         R+e4LZcQdVAihE3rdN9H78ifdPJQsJDlBjDXQ4XXqfhPMtgft/GdrN/JYGJlwn+bVEZI
         BJtEWox+pYIvXHAcPeOIEqvnrFldNAerCHeiwEHFSuR+YZIrF2wyO4UD0ai9QupbDzAX
         BJ/YjH1StGEcRxnrhtPLSQZcCDRDi5QStoM2hHSYFmA8au2K9Ye8hRCDGXXrF64Sb7V2
         7e/ooGKsr8O3mTYoLvA9B3vzbMZ0/HM/w94EJn8GVLfF/5/TR7GRKbOTLXdcQNRLRJSJ
         Vovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hgH0s8PPXpzC+u6KlQUY0OheSaLFAPTeW98tNqYnm3U=;
        b=pYEKhkD7wSYTrU/9KQMOANBEWLPbuTB8j66tQM8PID3IdpzWs058iB8DKYTuR7FpXB
         tS256JxS9mIUNIW0ptja5ELh3YWZMKydoCMF3McDJTZb+fFzsLWIKz0iMh5A9ga0rJ7A
         mvaAxz6zowVW8/wT/Akz4S1g4jPdcSDY90Z29WN9mlzBj3H20jFDXLxRWudFa5/yHOcs
         /H9uNlbw3egXERFAfDptGHOF9Le4I+cz4IyZC4iRHus0QSF+FcDThr6TXDSov7B9DCWb
         ftPUo/JT2H0seLQLebdmEieOvoeNbBeS4xiZPG9FbHcPGkEweW9xsoC0ydgW/HsIy300
         wV6Q==
X-Gm-Message-State: AOAM530QQ7zM/TO7UTypDY1UoHw7HklIu5QVqS3hpCE+hE442ugt5wFN
        WzWoxnxbOQSyPFNAOcen/lPO6pcV
X-Google-Smtp-Source: ABdhPJxR58Gn3XcuylHelgitVxt+imlv8A6URI94zT33yJ7dG8TpyzL2qZdixb95GG5Rc08MiafsGA==
X-Received: by 2002:a17:902:d698:: with SMTP id v24mr22269143ply.163.1594272649431;
        Wed, 08 Jul 2020 22:30:49 -0700 (PDT)
Received: from dtor-ws ([100.99.132.186])
        by smtp.gmail.com with ESMTPSA id z6sm1341951pfn.173.2020.07.08.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:30:48 -0700 (PDT)
Date:   Wed, 8 Jul 2020 22:30:46 -0700
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     "Dave.Wang" <dave.wang@emc.com.tw>
Cc:     Linux-kernel@vger.kernel.org, Linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw,
        'Benjamin Tissoires' <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] Input: elan_i2c - Add more hardware ID for Lenovo laptop
Message-ID: <20200709053046.GH3273837@dtor-ws>
References: <001e01d5a368$24946950$6dbd3bf0$@emc.com.tw>
 <20191202010253.GO248138@dtor-ws>
 <000201d5a8bd$9fead3f0$dfc07bd0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000201d5a8bd$9fead3f0$dfc07bd0$@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 02, 2019 at 11:07:26AM +0800, Dave.Wang wrote:
> Hi Dmitry,
> 
> List device with its corresponding hardware ID as below patch,
> Please check , thanks!
> 
> Add more hardware ID for Lenovo laptop.
> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>

Applied, thank you.

-- 
Dmitry
