Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D66CD2D814A
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 22:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393026AbgLKVvM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 16:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391893AbgLKVum (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 16:50:42 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5437EC0613CF;
        Fri, 11 Dec 2020 13:50:02 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id n7so8058436pgg.2;
        Fri, 11 Dec 2020 13:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Sj3sGpvqM/eIAz41u51RukA4uaqw2LCqwPcZJtduoN8=;
        b=b0f10ClhDPraZ6YR05aT5JpL/eimcmNKtp/aqZ+h8Hf2KrqKOSXnldQjz1V0VX3ad8
         lGJFS5gNaOaVDaNdOFb+d0EUZOxHWyRTP25CbiI1j/hsnR6PbZzIHbt8/EpfN77rPIgK
         fZj/HvADFT0cudlUWR8+zEE0M6YVVNcqfQCTNjNkaVrs5Zp61RExJy25to4Xw9CG78Tw
         tyDdJJ+art2qMHIRgkC+Efc3axnHv8Dv5SkpX02TOu8RzbU/h9+TnquUk25nTl/7oiqG
         0k8QRIrYTc2tSPsSLDXie2NoSO/hiELM3W5zzobqL8Ga99a5fN6/vBfwb/mrPbyz+pZ/
         WLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Sj3sGpvqM/eIAz41u51RukA4uaqw2LCqwPcZJtduoN8=;
        b=Ey02T8c2vOsy43FKN/jy8TLBYMiOq+yFEDcKvLttkR9r+tfHXJbKGEPVpjq8M3Kc7e
         +zRxiI4GoGTySyASseQTyajha6U78tk5bBjuM9jlKXZVfKSAiGF7EuHlu51md8DOdHJ/
         RkOv7pOpKaJF5GwylEOALJCoBxjHTqgqDmsPkW4EfWDxbdRSSDp7sy1/LgAQuiaEghhc
         mvfKdSiO/L47J8QMsYsWkchhKLNAqGgYuyRWK8T1B+CSzE3R8adiehW2lyfRRnctXGnS
         5mca05bc4u+oh/0zrkFtuJtBfrA1yKrta9dVoZXXpLwz+tW2YYw76PzFusH9w3u+4yzP
         +wZw==
X-Gm-Message-State: AOAM531/W82EBg9AVWw6pKM7CvvM6uCNGgVS0jXHOb36Jc8bxVynvtrX
        pg9HEnoVoTeva2yFHdVyQU6hPZuNMfk=
X-Google-Smtp-Source: ABdhPJz9gbDfINBlBeAXeYCoZy/x1HBgb5+TPRJNIB2LnuTe6I2qkjx+yEduREoIE0jYJJrgoPUaHQ==
X-Received: by 2002:a63:a516:: with SMTP id n22mr13520125pgf.125.1607723401806;
        Fri, 11 Dec 2020 13:50:01 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p127sm11522996pfp.93.2020.12.11.13.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 13:50:00 -0800 (PST)
Date:   Fri, 11 Dec 2020 13:49:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "jingle.wu" <jingle.wu@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw
Subject: Re: [PATCH 2/2] Input: elantech - Some module tp of tracpoint report
 has a smbus protocol error.
Message-ID: <X9PphlIJWW9u3iBA@google.com>
References: <20201211071531.32413-1-jingle.wu@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211071531.32413-1-jingle.wu@emc.com.tw>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 03:15:31PM +0800, jingle.wu wrote:
> 1. Add the conditional expression to distinguish different patterns regarding 0, 1, 2.
> 2. Add the function to get or set more bytes from register
> 3. Get and correct the device informations including ic_type, module id from different pattern.
> 4. Add the function to change the report id 0x5F of trackpoint.
> 5. Some module has a bug which makes default SMBUS trackpoint report 0x5E has a smbus protocol error.
> 
> Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>

Applied with a few minor edits.

-- 
Dmitry
