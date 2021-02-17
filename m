Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25CD31E023
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 21:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbhBQUYJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 15:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234056AbhBQUYI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 15:24:08 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83916C061574;
        Wed, 17 Feb 2021 12:23:27 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id m2so9217112pgq.5;
        Wed, 17 Feb 2021 12:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=09V/Lx9sq9HWVGABhiuXxan/Vp0Zf4Nka8njzOOjfos=;
        b=cUD6Ej1AeVls325jog8Wmpy+575Do8dxISLi6y2qyyMgL9p31bKn6lTKy1Zq6p/sAq
         /bi/hyXz8vkhQvPVFHz2VeEcZS/UkfUZkoK7D7FRNRe7sDECReRfVS03oos8A8ZmBuJc
         An+UR+tgvYdXCxZwe7/6jxgVei1JYdgz9Yoyr7rddtSkXmvNinx+km6qkfkfwOovSS7U
         pzMos9HfaySCdw/EYaJzn90sJRHA9qs0UJ+Pt0H9a/XiMnLtf1PDb1Zwfun7Qy+GbIJ0
         tzbMh10KM53sXOdZD1jWYxc4hfXlnkoAZLKM0ENA5lgp9uZxIVdJVRKMaPfSwpNLzyRs
         hW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=09V/Lx9sq9HWVGABhiuXxan/Vp0Zf4Nka8njzOOjfos=;
        b=sR80K8I39uey2fQFZgQZ1zeqvzQ2uHiYEzaMDtu5LuRT7eXRrO8mMgWwY5I08gtJXl
         OQzZxpnqNa30G2FSjWCcdJZwVZoJYjY+/Vix627aiXeiYjZOchsiz9UrPysyFwMbofkV
         hnByT0b7URvKPnbc/9nvXikAOpxKuYeDBDUhdAcHsAZxhBGZ8+gL/GeWg9Rv9Hnw9cpn
         v6E3+MwZdt4iCsSu7nYT4zCFHkdv8OXfO+qw6Vha7ALU2loIeKTyzTyFuwwl/mRjHfNL
         R8TQgC0yp25YeDXqkEXU78sy2vpX2USEqsZ3cgyIxt6NoPqNUN9qaQSuhHKDexJksE/n
         eR2Q==
X-Gm-Message-State: AOAM533hGSZNYDKTFeSq/0MUkGmg+l02AjtI++89+okyDN71Z6P+6N6X
        L30m9hZsLoq44qQYZ8/xY4Y=
X-Google-Smtp-Source: ABdhPJylECupCMg0rupEa1KtOVV5M/jlEfVnh/SN38BdJtujZIVXXrj3N+VIKBqTHkrYNtmVbb2NPQ==
X-Received: by 2002:aa7:961b:0:b029:1db:532c:9030 with SMTP id q27-20020aa7961b0000b02901db532c9030mr901491pfg.30.1613593406843;
        Wed, 17 Feb 2021 12:23:26 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a459:a528:1312:4d4c])
        by smtp.gmail.com with ESMTPSA id c9sm2847192pjr.44.2021.02.17.12.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:23:25 -0800 (PST)
Date:   Wed, 17 Feb 2021 12:23:23 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ronald =?iso-8859-1?Q?Tschal=E4r?= <ronald@innovation.ch>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: applespi: Don't wait for responses to
 commands indefinitely.
Message-ID: <YC17OycMiNipMUyn@google.com>
References: <20210217190718.11035-1-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217190718.11035-1-ronald@innovation.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ronald,

On Wed, Feb 17, 2021 at 11:07:16AM -0800, Ronald Tschalär wrote:
> @@ -869,7 +878,7 @@ static int applespi_send_cmd_msg(struct applespi_data *applespi)
>  		return sts;
>  	}
>  
> -	applespi->cmd_msg_queued = true;
> +	applespi->cmd_msg_queued = ktime_get();

Will it be OK if I change this to ktime_get_coarse()? I do not think we
need exact time here, and the coarse variant is cheaper I believe.

Thanks.

-- 
Dmitry
