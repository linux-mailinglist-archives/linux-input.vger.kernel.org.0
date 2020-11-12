Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83F42AFEE1
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 06:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgKLFhQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 00:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgKLBxw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 20:53:52 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3052C061A4D;
        Wed, 11 Nov 2020 17:53:51 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id z3so3011036pfb.10;
        Wed, 11 Nov 2020 17:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b5uOuNokt5wli0Xxp1Wi2tlz8LXZ92a0ZA2v8vPyOyI=;
        b=Fn2EAZr/61SYCma5hh086HBrvbEBpIumxWX7HNbpFPUBYAFHeZM0SU7Jn0PMP8JB9c
         APv6+biLDCUDmQ0GnpvsCRVj3F4YihXuDwC0J3/jgCjizJwaFYhLS+EBTzmcl6WW9ZC8
         fwfEn9gpiozWygxdYDrRlbFBFNxOdpZF5E6JRLkmWC2YumuiXvkeygtvCBjwS4hAjeur
         8t2LzbmmjRtqBScb20E+Qn3EVehkDW7VoOjo81KebgqFl94NUNKdXgGGZmqrm0LjviEO
         dmw3eufdCtrh1acgx2r6qhvafQl+/zFbX2YrtDm7sVU8knBLNbTXxP6AhluLRoNM7yBo
         E9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b5uOuNokt5wli0Xxp1Wi2tlz8LXZ92a0ZA2v8vPyOyI=;
        b=JWuEZ02nvxs4lVjyAfvYplEnskfoYlTWrOmAtM9KMzQ5fO+pm2smmiNDx/IH38Zz3e
         BtDHEvthEsRKmne8HwdeSNQ3Quv/Gjt+FFSKZ1Ay59U7EQWfd7veksIDNcv8F6WXxveR
         mJ5wZ3VH2KRwenRKuIEtXkG9E+pHbh+zMOoS4tY155p2jMVLjvFC7FWj5ZMChxDOuNUY
         jkG5xqU+E9qIapVb1R8uy5MjXuXe8J6oMKC483xJEnpsIDLHd3RbQyRE2L8HAXEoG65G
         Y23PREQLtmcBNTcjVVEHdOUXXE7/0O3kaF7H812aOZPZUBDCy2bGaiBqSsekeQ/oZOAF
         lOxg==
X-Gm-Message-State: AOAM533HZfdwr09gff9g32Tdi4Y7FoV+UIIenEQfd7fGmH/QqwMsa1Fk
        tLxe6j7az5Y9yS786aYDrqg=
X-Google-Smtp-Source: ABdhPJzuc6Q0dWdf+CC+3/9sm/XErM8SfgW/Qeccb1jj1BpXXPBAmzlqy7gr4fKo5GGBD6YqdkhtrQ==
X-Received: by 2002:a63:7703:: with SMTP id s3mr25164566pgc.9.1605146031486;
        Wed, 11 Nov 2020 17:53:51 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e14sm3975917pga.61.2020.11.11.17.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 17:53:50 -0800 (PST)
Date:   Wed, 11 Nov 2020 17:53:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrej Valek <andrej.valek@siemens.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild-all@lists.01.org
Subject: Re: [PATCH v2] Input: st1232 - add support resolution reading
Message-ID: <20201112015348.GD1003057@dtor-ws>
References: <202011030200.dKK6cKCM-lkp@intel.com>
 <20201103073949.12198-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103073949.12198-1-andrej.valek@siemens.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 03, 2020 at 08:39:49AM +0100, Andrej Valek wrote:
> Hard-coding resolution for st1633 device was wrong. Some of LCDs like
> YTS700TLBC-02-100C has assembled Sitronix st1633 touchcontroller too. But
> the resolution is not 320x480 as was hard-coded.
> Add new function which reads correct resolution directly from register.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>

Applied, thank you.

-- 
Dmitry
