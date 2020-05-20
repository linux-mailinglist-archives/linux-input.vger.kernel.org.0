Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C07B1DBB85
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgETRbW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETRbV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:31:21 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B125C061A0E;
        Wed, 20 May 2020 10:31:21 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 5so1657560pjd.0;
        Wed, 20 May 2020 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ho7dmrkmDaPCiJPKf8FinhvoxJji/Zq/ilYr7bCX7Y8=;
        b=CKvbTem4xVZ91f9MDE50bSgA9ENxqJI9MVY6FXtdxc7FLVm8Mt+l24lkQAc+9c3ZVT
         jW0By8yoQCRsOikTgv7IHTZSmHTvn/2TZqJwisgJOtE168eBYz63n44oWACdDLIYGyXz
         MDrA9ELf8NBIh0PyFqY63a8adf060CSiZ4DYdDaahW1iy3S2GInKhPEaCdhv82tiUFnL
         YdVGGxMw28WWCkB+hKUGEF5kM83BhsbHrdpPMNJ7+1Yrl99vPl1vrDSJ2yxDLvCq6+hc
         J5H3Lm0bypaxvGU508uISRk7K2v4qRer468v2oK7Y0R2Yh/KAfjZbMMCvQC+rl3UNv5f
         MjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ho7dmrkmDaPCiJPKf8FinhvoxJji/Zq/ilYr7bCX7Y8=;
        b=eZAFxCMIM6FB/VrxYsRXlFdj7wzDA2m6H3Ks3VxrGYWo6iWFe+MIePBb8atMRYaE7B
         SkiM55HjF9iusLvLTSLBbnscDmZS4DakQx5AFB8ZqbTSgPhy6ZkmYrEsZ4kALPzrlTS7
         vO6jyyHY+ut9DoJBcMlkl2j8PaybOmTysrhcAOo1+5w1qBP3/3/xhhRn83TbzxhigHGm
         /27jIkZUENEvUfpJ6FLpW+9z5Vm9HuIG1Zug0ek777YmcT6SGES2b0XAlq4E4D/EeXsT
         /kc4emNORmXkIqVx0nX7UFgHeyuSN/BfNVndYjh7qkQH8Gsw7j8d3+YLZ8H2MXX5zQfv
         ie1w==
X-Gm-Message-State: AOAM532Spv4+JFgeu1hXa+9Qu/E0wKBdMYKQt0J1VfS2K0OC8FIwR4SO
        LJ6t6NfsDOM5+d87lD+rbXs=
X-Google-Smtp-Source: ABdhPJz81brJ9Q15YHLnRx97sVtdR5CdE7Ywh/ve5zDHLA8Qzl25M1yQQ8KSK25cI9Bkf+QE0ghoWg==
X-Received: by 2002:a17:90a:734b:: with SMTP id j11mr6556215pjs.108.1589995880825;
        Wed, 20 May 2020 10:31:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id t10sm2536861pjj.19.2020.05.20.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 10:31:20 -0700 (PDT)
Date:   Wed, 20 May 2020 10:31:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 2/5] Input: EXC3000: switch to i2c's probe_new API
Message-ID: <20200520173117.GU89269@dtor-ws>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-3-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520153936.46869-3-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 20, 2020 at 05:39:33PM +0200, Sebastian Reichel wrote:
> Switch to the "new" I2C probe API.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Applied, thank you.

-- 
Dmitry
