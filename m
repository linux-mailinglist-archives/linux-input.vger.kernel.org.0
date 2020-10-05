Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDE7B282EEE
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 04:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgJECpu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Oct 2020 22:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgJECpu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Oct 2020 22:45:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED10C0613CE;
        Sun,  4 Oct 2020 19:45:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id u3so4608333pjr.3;
        Sun, 04 Oct 2020 19:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0GCiSzO/WswfLELHpdtXdN+2JVjDW9u6HFzGW5DWo4c=;
        b=YSPcRVKVeekZbrnJ3S+4MiheKbrjzwPn3yektW6SpTZixL9KNhDquvD+Vm+nGerr3J
         VZqzQpSVvOi784A/Ql4LJr3ll74+IU9zHX91XmsIZZ8ROgOKFbPJdROx0aERcN51HP92
         veqUtqxD8OeREyB/WtR/fTlSxTropjNlo64Nb8msApnHJRY3oG6l9RVDnJA1G7rKCkVO
         zZ2HW0RdXtoAvkrTScan+BrxZ5NYuTbPvlQRTZgEMLoedeTtZ6jgKzZDESvbY/Rr5CCp
         JSaJPJUneypEAz2nzXDOchXTFhb4WHaDqYA5Dhdrz19LxSj5j4ZMdNar3bJi4okMM1Nu
         VKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0GCiSzO/WswfLELHpdtXdN+2JVjDW9u6HFzGW5DWo4c=;
        b=FOPgR9ClQzWqzvhwebfgN4EEDebci6R8ZVkaTPlbRkmysM6S80ohAPWfj25rzWC+Oz
         rtWqLSry3PH0/YODGy+rtMF7NhFI+13aFUg88dNryfNWk1ojjYWIxlFhVpHu91bvObp3
         Sj8aboMMliT3UQEVFOX8oWaqKi/T5tIwhho3y4K4AnIzvQmxYWqRV+NC38vQucMPBMx1
         v7gl9FY8mM85Nz3K3s4tIxhtBubYO8qLjGoPUDfPMKwyVxonTX2/nLHbvY8DXwjg9xeV
         /PBXceUCsflj1q33dmmorwO30Xoa645H9Zc1xSHElaP56QXzKnV0uQn5XGKuXJTMCQ8H
         o0Vg==
X-Gm-Message-State: AOAM5309JbVl/glrrIRrFA7tQNaBKMrFggylMz7hpBYnBpLJVF3za78p
        HDrTRDR1AJyJ8ddIYtdx46F37ZwFNGw=
X-Google-Smtp-Source: ABdhPJyb0607MAnZXoDcIMQpem7m2TzMBStlVHYEv/PXMMUQQWQezrQgT317aMOO3Rjh4gKXDzCZog==
X-Received: by 2002:a17:90a:e44b:: with SMTP id jp11mr14071399pjb.96.1601865949924;
        Sun, 04 Oct 2020 19:45:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id s3sm10144365pfe.116.2020.10.04.19.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 19:45:48 -0700 (PDT)
Date:   Sun, 4 Oct 2020 19:45:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: Re: [PATCH v3 1/2] Input: synaptics-rmi4 - rename f30_data to
 gpio_data
Message-ID: <20201005024546.GB1009802@dtor-ws>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
 <20200930094147.635556-2-vincent.huang@tw.synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930094147.635556-2-vincent.huang@tw.synaptics.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 30, 2020 at 05:41:46PM +0800, Vincent Huang wrote:
> f30_data in rmi_device_platform_data could be also referenced by RMI
> function 3A, so rename it and the structure name to avoid confusion.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
