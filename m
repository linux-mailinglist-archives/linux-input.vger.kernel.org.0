Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F11D12D6E50
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 04:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388013AbgLKDGO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 22:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387768AbgLKDFm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 22:05:42 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21E4C0613CF;
        Thu, 10 Dec 2020 19:05:02 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id v1so1482237pjr.2;
        Thu, 10 Dec 2020 19:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NiJXm49bb0+mRAzm+9WCX1DuxepspdwYot+zYnU24TY=;
        b=jJPI7KpYIdeRq+Ht1nNATy9GMpr7rNTGQv9dtKarJg0Hsqynb7sHB6oDtdwESBhzdm
         Ekx2kfMZlSigOc8fdmxpoJBV8eIsSzv1ImGdXwXH+y3BDs8+p7Q5aDNfCbe0Re0ukC6o
         +JpXcg38mTFWdRmdZX6upzmWq35JgOoRimkqLiKmNUM+U7JqYrDh2FJvE4RHtcdsNDQJ
         PqYFqcKkq1JlhOSHWB5vlcAFoLr/Uq9b4Kcp7NqWgw+Kuc8kMIaDhGCEP0Tu9EfSjxAx
         7bODazyuaybB/0MTArv3zTOFuB7bEero8vvioAeixXzBNuZytqZrab2w+Vrw/DKd1Ahb
         /wXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NiJXm49bb0+mRAzm+9WCX1DuxepspdwYot+zYnU24TY=;
        b=fbrJHG1dgTIkzSQOs++wsLthlYyLktXhjsyahH8sMT+K6EKf/+lz0rFsP86LYduapR
         ESnyvcqQHKrDoTkUPsXnJBue6w5dbLxF0MreF1rBjfZcm9KO9D7fP9PwZFqAFLxoobOr
         CoICCED3pg01cCZq2GpdTt1mwbJcS+pO0YkmhT8tT1c1W8ZgTALiDTpSvPVhlh3O+UjF
         9CKu6t6qMR8/c4z06A+qZ+k9ror937WVdcVBup1LnzQqm/cGxTl4PKJdr1UCACx09ZO1
         FP2cDEIDAjOB61Q2IXzBOVTeqU+BeT6wusPIId+VGCGJ7ccZNYpNIxvTD7Mc+9E3oXbY
         QChQ==
X-Gm-Message-State: AOAM531I7527nI68gCb+zoJZmR3WtJqYtxA8vKKY+tfNbf3RNkBbFH7l
        kxI17rRH5yMJip12YQSdOZY=
X-Google-Smtp-Source: ABdhPJxyTt2+80BKgtYiWsQjqy+tE+647/gV6Wi1HcqlFJsoikOjpRwGoBRiCdr+YoEevZ1Rt+xXVQ==
X-Received: by 2002:a17:902:8e8a:b029:db:de2a:2e58 with SMTP id bg10-20020a1709028e8ab02900dbde2a2e58mr1508616plb.39.1607655902193;
        Thu, 10 Dec 2020 19:05:02 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id l23sm7745673pff.194.2020.12.10.19.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 19:05:00 -0800 (PST)
Date:   Thu, 10 Dec 2020 19:04:58 -0800
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     jingle <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw
Subject: Re: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type
 0x5F.
Message-ID: <X9Lh2n42om+SNEFx@google.com>
References: <20201207090751.9076-1-jingle.wu@emc.com.tw>
 <X9G8xUk/QvcxsNWi@google.com>
 <004b01d6cf66$b1a8c590$14fa50b0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <004b01d6cf66$b1a8c590$14fa50b0$@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jingle,

On Fri, Dec 11, 2020 at 10:38:22AM +0800, jingle wrote:
> HI Dmitry:

Please do not top post on the kernel mailing lists.

> 
> I would prefer if we validated report length versus the packet type before
> accepting it.
> 
> -> If the tracking point report is 0x5F, the report length is 7, but the
> touchpad report length is 32.
> -> So, report length will be different with this module.

Right, but we could check the report type when we receive the data and
refuse it if length does not match what is expected for the report type
received. This can happen before we pass the data on to the
elan_i2c_core.

Thanks.

-- 
Dmitry
