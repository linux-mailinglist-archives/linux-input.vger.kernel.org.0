Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27951AF68A
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgDSEQz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725769AbgDSEQy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:16:54 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD8CC061A0C;
        Sat, 18 Apr 2020 21:16:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f8so2652305plt.2;
        Sat, 18 Apr 2020 21:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kU0p9aw+A0xfGwsny6vGac9AzF3D0tuCko9aqz98MDU=;
        b=j/lXgxMnJWvdxuBsbB20Y9rFbFfaWqQiJ+PENWoMvGxF+uWHoZQx0Q8idNgKkDt+D3
         nWPEyBMw+Ef7Fx3V1NjP++p3TcBvKEt59wx18l0Hzltj+lGeOkw/HHzdWzE82Hss/qrK
         Fojf8oIK3RRIcYybgD9AsFL1tzbj7T/50yRaE5U6cqjQz427daUfqnOzE1NpOygpiLBG
         wW5HLSoMGnAyp/hApn0yRQUHd3LrLf1fKF5/aL6LNksk42e4y2XJbxCGBU1To8oIqIvr
         r17mtAd7cYHflv/Bfer5rWlhnRvRPt4LWbjBCgt6fctcEMgDZ1IglISibhqrtXS+hNKq
         ss/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kU0p9aw+A0xfGwsny6vGac9AzF3D0tuCko9aqz98MDU=;
        b=NFhJJFNZrbZg27VbGolig6NhNbgOLtkcYgWHJwlKj/8w6Xdw1AJzEPwj/uwfCEesdp
         8cCExovxr9OCYZIubFKp8BRRJTM3WWZphBzi+QKyNMrdWmvw56Vfc++Ca84ICU9P+hf8
         jQI4OTDho+Tw5hanof7xQAU688wwVNjIBgFeXtsm7ljrMlWph7Kccpbnimx2qjt75XJJ
         tMEZACLKHzrNyWCH5Otk0n4joZYSlgsUckXpiJrf03ycfDT8bi9D/OyJx2/Bq35qBvTQ
         fZSy7eRACdHQi+bhWivYvvML5/jJJsjia4AV1EuMxlOhiNqE2H5jEARb2y9SU9oNIgNE
         DtXA==
X-Gm-Message-State: AGi0PuYUjJno+AWSUACGwy9GmvDNczb4bQUJhYUcrLhqKuL1I/Kch3Py
        XfXngPNeEAT69aH5YWUyNoE=
X-Google-Smtp-Source: APiQypLypuF0eqNaoat2cvX6Gk4Cu68xsHtG1GX/968EJ9GCk8OY72ucQBAeLZ9v79JmjThBDmHkzQ==
X-Received: by 2002:a17:90a:eacb:: with SMTP id ev11mr13342906pjb.80.1587269814013;
        Sat, 18 Apr 2020 21:16:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x23sm1897205pgf.32.2020.04.18.21.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:16:53 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:16:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     LuK1337 <priv.luk@gmail.com>
Cc:     Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Update xboxone fw2015 init packet
Message-ID: <20200419041651.GD166864@dtor-ws>
References: <20200415185941.388910-1-priv.luk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415185941.388910-1-priv.luk@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Apr 15, 2020 at 08:59:40PM +0200, LuK1337 wrote:
> Appending { 0x05, 0x20, 0x02, 0x0f, 0x06 } to
> xboxone_fw2015_init fixes an issue where the
> controller is somewhat stuck in bluetooth
> mode until you plug it into Windows PC.
> 
> Signed-off-by: LuK1337 <priv.luk@gmail.com>

Thank you for the patch by the signed off needs a real name please.

Thanks.

-- 
Dmitry
