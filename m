Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E69533AFC2C
	for <lists+linux-input@lfdr.de>; Tue, 22 Jun 2021 06:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhFVEsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Jun 2021 00:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhFVEsn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Jun 2021 00:48:43 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A54C061574
        for <linux-input@vger.kernel.org>; Mon, 21 Jun 2021 21:46:27 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso1506898pjb.4
        for <linux-input@vger.kernel.org>; Mon, 21 Jun 2021 21:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Lg+PacMqZTuq8Jy1/6OpCX2y6psrEykiYDFGHzLD8LY=;
        b=HiF7R91hjMmnRdWNrQlkugoEBwIqb3fVOB6dX7xYT5Xg9D3lPfTScwtnY53ZfOgdAe
         ZOJV/8jJEdqS1Q5cJrnsWtj1tLtdfr2vbpLrRne+oM60zW8PgcyxVxR8XkKHw/LSIWIt
         7BaF4Ni4rdT0T37DwcWthMw0Tw9u/P2IM80PbVT7OTFa0BCDhtki+3yddwKpQG4U0syD
         n168ZjoBJ2l+dTEmK8SAhX8Cphe1tsR4JWDzOEl6CZkpadwb2RUstGhQuIhosGP2gBKf
         Fu125AB4nCDSheKIaZNLkFrTUL93Ts0tFIQHg97Lxf/GwXjkrYYqoDg1Jq9PcXge1jAX
         6rxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Lg+PacMqZTuq8Jy1/6OpCX2y6psrEykiYDFGHzLD8LY=;
        b=GMralcGcNOsqZp86Voy/olFwPzXASr4OnJLr/0DhndfjBx59diflqYqu3R/1fHVhrF
         ssmZBwHCZv2RdoOQQgEqs80EJ9AFPtAmBL7QX2h5KZLaJRsiN3t2GQOJpDbBHTD5HPM0
         /hPuNASC0T/24a/fFgyKZA0iSmOTOfqER0GRQQ9iU4e48juaHbcvgP5eJs5OvdFXxG4l
         cSJtWKPARjsoq5nGP77WRM3l0fddLec2SBna15mUig1UWsrplrs06+uBG8Mbu0YPNRWE
         V1ssVNkBeSOqLc3LQ53SudxSLgEON94PTV8j8v/a5sIbO4uMIeuHZ8i3LOKYY5EF10W3
         Qehg==
X-Gm-Message-State: AOAM530nhV28Xb472xF295wnDpd1p/7fwg3b6DN1YwSpv9ZYBq/jsKoe
        mUoEAbdS4hO3w6HIX0PY2VextZluku4mvtcP/h1M7AcEUvnrvXlA
X-Google-Smtp-Source: ABdhPJxo5g7sIZ6J1EU6tXtgguDgI6WUyRSHWbxioHIgFZ0b6HJtpMt+0xK/rxnF3YhGzXc0VE4yySKB1gA8X508eTA=
X-Received: by 2002:a17:902:e313:b029:125:827f:c621 with SMTP id
 q19-20020a170902e313b0290125827fc621mr5855474plc.25.1624337186634; Mon, 21
 Jun 2021 21:46:26 -0700 (PDT)
MIME-Version: 1.0
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
Date:   Mon, 21 Jun 2021 21:46:15 -0700
Message-ID: <CAHpHHjbDGjSaupSsG1aQpP+s_hzaSs6ggJfLSYQGei-ehnXu2w@mail.gmail.com>
Subject: Re: [PATCH 1/3] amd_sfh: Extend driver capabilities for
 multi-generation support
To:     basavaraj.natikar@amd.com
Cc:     Nehal-Bakulchandra.shah@amd.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        shyam-sundar.s-k@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> +static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
> +{
> + union sfh_cmd_base cmd_base;
> +
> + cmd_base.ul = 0;
> + cmd_base.cmd_v2.cmd_id = DISABLE_SENSOR;
> + cmd_base.cmd_v2.period = 0;
> + cmd_base.cmd_v2.sensor_id = sensor_idx;
> + cmd_base.cmd_v2.length  = 16;
> +
> + writeq(0x0, privdata->mmio + AMD_C2P_MSG2);

That should be AMD_C2P_MSG1, no? The new hardware has no param register.
