Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9B51C95D9
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 18:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgEGQCC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 12:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726029AbgEGQCB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 12:02:01 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A3CC05BD43;
        Thu,  7 May 2020 09:02:01 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id js4so775712pjb.5;
        Thu, 07 May 2020 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cZncqyqJ4SE1LeXF8cnICnZ5Px31ttNZ1KwHvvQo43s=;
        b=IlXlxsjddN+AXDLhOToZqXjHLdt5dCVyQa08jO8PsAbTcmmCQaSj1z2LeZWX+0c8vx
         V0ZOiBusAlL+IJAKhHZAH0RPMrEJzFus0KCSmPGxJ6sc/hiqLyuOwv8/PPIY9yaiTcwt
         GJboArtSFUdyMDEK2JqfBHPU8Y5T5igb2g47t+RJiE+ZzMPTKAm9t8zQB5+PDEkDjob/
         WwKG6ICxDQTjX5duPAJ5TuMqCh818L39g91ncYHSonNM0wKghD+j2bv3V9HjjK23gpZL
         JW4tMCLMjJl4D3f0R1bIQ3K3NE8dyR0MPonfq9Np/e5zIuMVZphoawXxmH6wdPNWtdjE
         v+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cZncqyqJ4SE1LeXF8cnICnZ5Px31ttNZ1KwHvvQo43s=;
        b=TAESNY1xBkPHjWyVzaO1m7vdU0l5qK/U9WHYTemKNZt7/nG47dkf7Tz+2KyqlnEwpM
         KZjIdx24wbLOvmBnnnwc3sQnFkzBSHgVl0wHtZ51Lk3NMxF2rTCII54USKrJBKb1z+k4
         LK7xJQe/LQlngUe/SwrYI73QxQXWkTFgQsSL8ffWVrf3s+lZoXhaZuCehqcBz3mz7ZE1
         QOgCzrWq/588Fk2I7Lh4mURyWt3GTNef9G4ZDrkEc9mGzWOddPHKJWocgWdCY+P4RqQw
         P8VUWI25bdQQFt1ESMZ3vJCx1KxqzsHqiyKknV/Q9+kOfX18BFTY25RH3r5mP3CqKZYe
         hmXA==
X-Gm-Message-State: AGi0PuZVd+7xaIP/ByG9/ztcg6BEU1knNviyhR/KQ4O8MpzbG6Mg4bMt
        36Vf714jhfsK6jTmtTePOe8=
X-Google-Smtp-Source: APiQypKShS1unDIC1XzeAcZq+Zp0YzE+wYcvNoRYml/HYTMb7V4yF8q2NwbsvnfNMpQWdYY771H27A==
X-Received: by 2002:a17:902:6f09:: with SMTP id w9mr14054236plk.245.1588867320825;
        Thu, 07 May 2020 09:02:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id k5sm236889pjl.32.2020.05.07.09.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 09:02:00 -0700 (PDT)
Date:   Thu, 7 May 2020 09:01:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: wm831x-ts - add missed input_unregister_device
Message-ID: <20200507160158.GI89269@dtor-ws>
References: <20200507151259.792697-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151259.792697-1-hslester96@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 11:12:59PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in remove.
> Add the missed function call to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
