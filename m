Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2D589776
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 09:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfHLHBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 03:01:50 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36354 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfHLHBu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 03:01:50 -0400
Received: by mail-pl1-f195.google.com with SMTP id g4so1031263plo.3
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=szw83l+YrOUujVrf/dDv6agMZFYaIUDn85kNA6t1FAg=;
        b=B4tlqN9mi0xGdV3bKTorvoDV9hSi9RMNI+T4RaFeEOBQw6SKj/qXgTetagO0njnyKy
         ox9Un/cD/n5/KziaXYb5rl7uz6JJf+rHr66QlMHohUmSzJotRMM1GsnIIUOObZNF/4mm
         +5ium9gdqC9/i5jkmvegaJGw8cciR43wrEwKwd4SC7mLAdxhN+WA97oPG4miE3egS+Ol
         nHdMOo1BDlk04a/s6Ki7YUCchqUr52bII7zbiozXzKj3quTg2NTjZn3Bth8N8sIqJlvu
         UZvXnMNOBiJ9qJpp96GLQ9rcSrmwCV6PwI3m5ASLv9N5lH9l3LQQr3sxBVNC9cBtSHXf
         QcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=szw83l+YrOUujVrf/dDv6agMZFYaIUDn85kNA6t1FAg=;
        b=Hg34UqfCwSnwtxFYX/m3zasyqMvcObKlnogpTPfdY09k6W7mVOTg3WSQDGjvm/XLie
         C8AxZ3cSQCeLnLUi/84H7erPuGnwdEc9D8RoTC4djrSUJ2E2UsqQ0qcLTtK9kFGJ5hQ5
         5P4EYA0l82qiBwmMbrrUtxQgs69xaU6oaSb+wKBeJRyPFj7i1meoazJBSEBqI+uZ405d
         5nJtQQnHg1vIpQ5ya9lpHoTHTSDGDugNHDNg0rvXlKlgzNsobIm9/Dqfrd0c8Qpo4G+1
         QSolKZSoBKPLYjJOswVrr8rCoacC5oWiiRc+o9RmFWZtLRf1GpvxFmrioJV6fVXkSTpW
         VQNQ==
X-Gm-Message-State: APjAAAXrPkNkkeuh4D17fpE+NBmOuYusI91yIMsB4382PrgMRzA1Xj2B
        pr7gpNk9eUvmynf0RU5QJnU=
X-Google-Smtp-Source: APXvYqzOKdg8EB4XYuyyfW6tDqMlFhOKoD1SP/y7Ak+yV/XxZ0Le/3G4ATgtinWPZX3gG8i3dk6YPw==
X-Received: by 2002:a17:902:4643:: with SMTP id o61mr31386968pld.101.1565593309250;
        Mon, 12 Aug 2019 00:01:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s7sm10822617pjn.28.2019.08.12.00.01.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 00:01:48 -0700 (PDT)
Date:   Mon, 12 Aug 2019 00:01:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v1] Input: mpr121 - Switch to use
 device_property_count_u32()
Message-ID: <20190812070146.GW178933@dtor-ws>
References: <20190723173800.66553-1-andriy.shevchenko@linux.intel.com>
 <20190728100038.GB775@penguin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728100038.GB775@penguin>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 28, 2019 at 01:00:38PM +0300, Dmitry Torokhov wrote:
> Hi Andy,
> 
> On Tue, Jul 23, 2019 at 08:38:00PM +0300, Andy Shevchenko wrote:
> > Use use device_property_count_u32() directly, that makes code neater.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Please ping me if you do not see it in the tree by rc5. I'll sync with
> upstream to pull in this new API around rc4.

Applied the lot, thank you.

-- 
Dmitry
