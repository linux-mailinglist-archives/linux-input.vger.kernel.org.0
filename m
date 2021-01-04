Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CDC2E8F3D
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 02:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbhADBoV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 20:44:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADBoU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 20:44:20 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69938C061574
        for <linux-input@vger.kernel.org>; Sun,  3 Jan 2021 17:43:40 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id e2so17859242pgi.5
        for <linux-input@vger.kernel.org>; Sun, 03 Jan 2021 17:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XYZLP5AKY/lfAUoMKixLK8q99hexGD0Ip0Mn8+sNJ60=;
        b=if9y/gOocp+Z15eKOLiYDYh0kQJ7drMYlyT5DeojKYORXbEaGIbLUQkl2VctNTbI5E
         mQ3rycQglqWOEfrHCEVg8HJBZgk0+66vH0y0bWne0wntQpG34sFeDTV5Nbt0M0LS5xbb
         HtB3OhVi3pZihm/mNhzuKZo3wJ0XrvSybkpChwDy8ZBY4povJict//eMisASTeMTwdEy
         A2vbuK55qx6ymvjFk7ZsVhpjXzHznv3owa3Mfdjy6GPGTm6IkTWQQ6onxbDpStU1C8Zi
         TwlDhXGZCn5xZYqgV5Y54mjRPm14D7QINIT+AOAFF13U+TS7vfdkz8cAC+AALb0jBSdk
         pwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XYZLP5AKY/lfAUoMKixLK8q99hexGD0Ip0Mn8+sNJ60=;
        b=tUGITM/dTdQmeORjiYIBWsTqn7/4vNmpmVNbIUWJn+giNtuBnl1tZPJqzhvLZybtqU
         7tWmc/ipLovMmHWlgDzP0GAkmo3iowFWdRGA5EhgMEPUs3r0ZPT8zJvmd8+1ZxnwNYlB
         kShV9tSzqg3DwStGor7GNPHJ+4yccNx4290HgVj6yQDfuJ/LLbtkuIVIi221DJ6Idpw9
         9Kngfai40eVrUvEvWaxHWmo0Ng5phF6hdsH1D+pcBcpQaMsceo45jSESyaz1U8fq0aO8
         y7zk24tz+1i2iQIhjn/GnRoVnmNqbfLyYuF68JHSOBa1iPmiW+VsjYMo3/vxy8JNVCVQ
         Zrkw==
X-Gm-Message-State: AOAM532MOsUNx8MkmDxd+WN3D4tiSyGoSR+8TeUIUvH8NoUys0rVRSm8
        9XLgG1lzHkMb+nqqDBLaudw=
X-Google-Smtp-Source: ABdhPJzN3vN2FrJtJPLYBj8rxNmEYqYdgqpBEHjV6MSC5TSWOT/3gbZ+VcJwDrQadeaOsw0yzCYqXQ==
X-Received: by 2002:a63:4451:: with SMTP id t17mr64217110pgk.322.1609724619767;
        Sun, 03 Jan 2021 17:43:39 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a26sm53619393pgd.64.2021.01.03.17.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 17:43:38 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:43:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH] Input: ili210x - Implement pressure reporting for ILI251x
Message-ID: <X/JyyBMQgBSduQfR@google.com>
References: <20201224071238.160098-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224071238.160098-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 24, 2020 at 08:12:38AM +0100, Marek Vasut wrote:
> The ILI251x seems to report pressure information in the 5th byte of
> each per-finger touch data element. On the available hardware, this
> information has the values ranging from 0x0 to 0xa, which is also
> matching the downstream example code. Report pressure information
> on the ILI251x.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Olivier Sobrie <olivier@sobrie.be>
> Cc: Philipp Puschmann <pp@emlix.com>
> To: linux-input@vger.kernel.org

Applied, thank you.

-- 
Dmitry
