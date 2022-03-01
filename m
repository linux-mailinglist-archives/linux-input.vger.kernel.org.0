Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D6A4C8482
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 08:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231873AbiCAHCl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 02:02:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiCAHCl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 02:02:41 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3ACA793B2
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:02:00 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id o23so13639256pgk.13
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A1AEv5SdMFxqk2vTHTGJYnLUO3riY4y+U75sDaX0U4E=;
        b=F04HJ3s2/2SmplXG4TTidpDlsbnYnZGHK3v3x8x32JgWQykRyajhv29R6I6X3ohLBo
         TXawcrZQhS9PUgOFSOUmiPKOINuz8GcYttc7iA0chEamFLFTxyMJKxcu6kux1DrTcPLK
         nVUeJ3FwaW4rJ3+1N8J4RiGgiBtYGGvxbHNkrl2Mgk7oaAlREt/mXWNDrZqA6NWGSXqt
         fBtSWPB5/uamc7HAeMUbhnG/5zICTQoLo+bYeSZMRvKBuAmSJoN5n8N43UvODGZ/LZfQ
         UVnby315NiKhs56Tj0y0/sIM3gNic0bWHidazuu6Jq0y9VBMixjSOsqDGKvcuod4NTZG
         SnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A1AEv5SdMFxqk2vTHTGJYnLUO3riY4y+U75sDaX0U4E=;
        b=yRGySqlLT8phdI+JH1whaDfIMYxl2COirtlXuYgo6V41UkdVnphKHjIq1MwoMlsxF8
         l/7HsDsE01AwCftT7fCgF/+FwV6ajuWjnJTr1xBxwfLgmnMTIEvUUAOwOwYAxvQRsK+k
         hM3w0XcpyD2geMLOFdR7TxoiWYaGZvjjJkn/2RmVCzxbblgjUh575vbZQjHVwBuORB/y
         H0NSXlfK2xB9ZhgIMJ9HVeZ49WAkcXxH6INgk5oPCc4EK0OBlYoAJbdhQBEiHhdGjuQR
         TnJS6CTjkeVVKd7FNrVgtT9RlNfTJ4vbn2ZW8botUpBYx6+qA/Fm4x8NPMm07LNv3ELF
         8nZA==
X-Gm-Message-State: AOAM53305Qw8NcxcwrnSFXtO2GI/8AY6m/C4i07B/5Gc3lPVs2EHbbGP
        eXaMVGHzYNhHn0Qkv+BiNAk=
X-Google-Smtp-Source: ABdhPJwIo46yc+thkrAdi5528v7pfEmiFiWtRz7o2Kh9cl7Ndjvj1fKylLSUjJ9RERygTC4lz9wxDw==
X-Received: by 2002:a63:9d85:0:b0:374:916e:4b19 with SMTP id i127-20020a639d85000000b00374916e4b19mr20462745pgd.128.1646118119437;
        Mon, 28 Feb 2022 23:01:59 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c174:264:5e49:f2cb])
        by smtp.gmail.com with ESMTPSA id t12-20020a056a0021cc00b004e105f259e8sm15991956pfj.152.2022.02.28.23.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:01:58 -0800 (PST)
Date:   Mon, 28 Feb 2022 23:01:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 5/5] Input: goodix - Use the new soc_intel_is_byt()
 helper
Message-ID: <Yh3E45qkWlfROLbM@google.com>
References: <20220131143539.109142-1-hdegoede@redhat.com>
 <20220131143539.109142-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131143539.109142-5-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 31, 2022 at 03:35:39PM +0100, Hans de Goede wrote:
> Use the new soc_intel_is_byt() helper from
> linux/platform_data/x86/soc.h.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied (for 5.17), thank you.

-- 
Dmitry
