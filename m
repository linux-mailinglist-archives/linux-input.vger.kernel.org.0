Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C54A74BA46
	for <lists+linux-input@lfdr.de>; Sat,  8 Jul 2023 01:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjGGX7b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 19:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbjGGX73 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 19:59:29 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA7D211E
        for <linux-input@vger.kernel.org>; Fri,  7 Jul 2023 16:59:29 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-666eec46206so1922919b3a.3
        for <linux-input@vger.kernel.org>; Fri, 07 Jul 2023 16:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688774368; x=1691366368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDU+TKyypu60wGEHzksvC6LOU49O1Z4Fc2YZfi+cHVU=;
        b=pJFisWSFtbVnAI2GF6+l+08/LyfIAhjTRRWxEUM88DXElVMheskQMeP9VpjL4iCWlt
         ALcTBZLZahvjqHn5BiQjSBQ73AB55FrHW6B15UlaXzKEpBYuikhYCEK6Ir9vzAwe5HeG
         Qp5f6hWvR+2M5eZLUyxvPSecyXvBD7gml5WQvV8zpjkHKU+YCMMePhyn6RJojRjEkUDz
         aWEq5KUKfmOzuP+qHbKOd2KaO96jUOR5nIKfaq4JxAAguxyG8qBDA7+DxNr4Ky5naNwv
         oHGXcFWgHaAiTA8Bt6m/WM/AW8Wd8SB4lEcFkNkTsirMd5H8o4Cw00AODjOIvrgMqyzN
         ITyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688774368; x=1691366368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDU+TKyypu60wGEHzksvC6LOU49O1Z4Fc2YZfi+cHVU=;
        b=EA/UkHvibN6TN8U3rxVHTXJnq3bZZuyX4dpwpds1iEQeWBTGdUQBamPz4SaQXCKWqr
         kAbgYuxyE1Cxyw6LCFcaZPYt/EZPBwHZekG0yqPMsktIYFapzgAmbTjaba0EFyAoEpv4
         4yz1pifLLjeOT7FsBhJoT4JwRM39QXpHTOG4U9qIAIFhFNP4rYkNq9zodw1Ihite+Ts2
         bMnfGvEBC0pJsw86f8mks9b1ViJs1YpRmFg9n7m4lI1porOS/yLkSgQjLpuHTOKhWrH5
         BsvER2OYA4lXF2ocWVL3dRIIGUlYwYO3P8SUJYKiSbu6SfB86FjuNHdVc4LXnyaRvP/T
         PjzA==
X-Gm-Message-State: ABy/qLYNypG9Jn1OWl48n2oCgFTlNkS3M/ZNCsOk+O/Cp/227NyBQnKM
        Ud8SALGf36sOostWf4/wXp0=
X-Google-Smtp-Source: APBJJlGg5EWzlmf8ntla5uBEiqmV02bj8mM2ZmhdY2FzJrXTKhKhpnQGr0prR4yaLn+Wvi2eKyWpRw==
X-Received: by 2002:a05:6a00:2d19:b0:668:81c5:2f8d with SMTP id fa25-20020a056a002d1900b0066881c52f8dmr7751347pfb.3.1688774368220;
        Fri, 07 Jul 2023 16:59:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:38de:2bd4:8f55:60cd])
        by smtp.gmail.com with ESMTPSA id u25-20020a62ed19000000b0062cf75a9e6bsm3350846pfh.131.2023.07.07.16.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:59:27 -0700 (PDT)
Date:   Fri, 7 Jul 2023 16:59:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Frederick <doublej472@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add GameSir T4 Kaleid Controller support
Message-ID: <ZKim3VIIhKNv3aZ3@google.com>
References: <ZKeKSbP3faIPv5jB@dbj-hp-flip>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKeKSbP3faIPv5jB@dbj-hp-flip>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 06, 2023 at 10:45:18PM -0500, Jonathan Frederick wrote:
> Add VID and PID to the xpad_device table to allow driver
> to use the GameSir T4 Kaleid Controller, which is
> XTYPE_XBOX360 compatible in xinput mode.
> 
> Signed-off-by: Jonathan Frederick <doublej472@gmail.com>

Applied, thank you.

-- 
Dmitry
