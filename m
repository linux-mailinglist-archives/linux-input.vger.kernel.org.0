Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DCE1CC4B2
	for <lists+linux-input@lfdr.de>; Sat,  9 May 2020 23:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgEIVVr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 May 2020 17:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbgEIVVq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 May 2020 17:21:46 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D07C061A0C
        for <linux-input@vger.kernel.org>; Sat,  9 May 2020 14:21:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m7so2222595plt.5
        for <linux-input@vger.kernel.org>; Sat, 09 May 2020 14:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cCEfPVJO370PQfiIphIZnvC4bcvoLTIrmg2W5VA3O8c=;
        b=WXf+pHs95a70KIjcXEGmjDvHTwHe96xhf1+nY4TG4Hs6y3v04ntR8dbVqmmgvrbOBQ
         HbZHRVwurMsQGXERv/raWwkd6WjG4I3t1Ld1V+NHpT/cNI4YhCl0L6oi5t0d+ghWOvYt
         Xo8qy9WrpNroRWQylMa3YrI2h5E25rEB5foJ3tvJNFpvCr3VKDUiH0eY8Klfeu91yDQr
         VCQX4fGtdWsUbRGRiV4NfxC7MGaPxiPnjjhKsTzhvt2JmgE1X2e/pDHz49RKU2vYzeQP
         pmLXjyMXJiPiP9MAQwwy1iWz+ra0dc3jZFghN/RjRjz/eS2ZvRCkaJOcVn+I9/KCfyaB
         wWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cCEfPVJO370PQfiIphIZnvC4bcvoLTIrmg2W5VA3O8c=;
        b=Yx3KWlKXQlF0wxIXNziYGUDLMhndQSGH9ZTdh0cT3I6+3aoVWDfgKHgnHFPdQvp9Cg
         yke4NtvVhN27PCucdwRjEiID7zErjoUFzrgFogACJEz7JwYz0IWk7ru8wtG8eTMWHOPa
         5SI9Wv6L0eBP73cKb2n/8jyCO/5lDUCCxQ/o5g+v/bzivR5Rb22324XKN4vCE2IrbF7k
         2vIauVYneGKpSq0LnU1BfAr5scoap2Wt7sMooQcgcSx1QJ4JEvYDlLFFbeGkBVD9BCkR
         FI/pANfi1iwnbY6sOBEVPSkADlH9l0W6QB94g6Tcqd3woOVjNmFTqwpscgANTRaTtTnA
         E+zQ==
X-Gm-Message-State: AGi0Pubq3sRdZj00qaYdfWUueb4q5innlj9jORszjFXLAx7v0YgcgIha
        dvozIXho0gBO0nYgPrD8ml0=
X-Google-Smtp-Source: APiQypLuTzVe9Wp+O0J+BU/GQvE5EqdaBAxRr4vuhgHCxOpsMkYENk4yQhKzkLAAwK+NmmZ1KnLS8w==
X-Received: by 2002:a17:902:6b05:: with SMTP id o5mr8003785plk.274.1589059305476;
        Sat, 09 May 2020 14:21:45 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 62sm5279028pfu.181.2020.05.09.14.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 14:21:44 -0700 (PDT)
Date:   Sat, 9 May 2020 14:21:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        LW@KARO-electronics.de, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 3/4] Input: edt-ft5x06 - improve power management
 operations
Message-ID: <20200509212142.GP89269@dtor-ws>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200227112819.16754-4-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227112819.16754-4-m.felsch@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On Thu, Feb 27, 2020 at 12:28:18PM +0100, Marco Felsch wrote:
> +
> +#ifdef CONFIG_DEBUG_FS
> +		if (tsdata->factory_mode)
> +			ret = edt_ft5x06_factory_mode(tsdata);
> +#endif

Instead of #ifdefs I added a stub for edt_ft5x06_factory_mode() and
applied.

Thank you.

-- 
Dmitry
