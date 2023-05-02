Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1174D6F4BA1
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 22:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjEBUwx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 May 2023 16:52:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjEBUww (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 May 2023 16:52:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE5D1BC1
        for <linux-input@vger.kernel.org>; Tue,  2 May 2023 13:52:50 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4edc63c82d1so4968370e87.0
        for <linux-input@vger.kernel.org>; Tue, 02 May 2023 13:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683060769; x=1685652769;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxSZ5HWiRzoGYWLexaqAjBCEITiYObIFiQevUjVdyLc=;
        b=GQZRrS7eQXqRP9OXC9feaHdl2+5I6D9Aku77/5Vff6etgiWJBft1KHjFh4dk/N5bKP
         2ZOp9OA7OuD4X6mnNdGZblgZ/cWKN4byXe7BRWGkPESTTRF37DGHqV40wJdsjGAeCJuc
         HROycDC0qMI3DMpyCdsTWMMOb+quFV86xAEh5NcK/HIhSZYrYjTdE25o/U3p0YuVzxwl
         4WfF8Zrby27xav9r5pyVoFgBQLa5hqCH/H0W0/JSeSe6mkh9Ht+Quz6XeEGBWL4q5Jb7
         V8ub9sju0VeIYRfDtDTiPna23c1KOcyw47koz5q1Ui3CgtEb0VzOIZODxSy51xExZv5r
         066Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683060769; x=1685652769;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxSZ5HWiRzoGYWLexaqAjBCEITiYObIFiQevUjVdyLc=;
        b=ZTUAK14PhQRcJLiokz/a24E5Vyw2I2hBHb+GSHM4Zh6rA01hFMI9B5NttrpnWiEaDC
         6JJIvXdS6giIBAbyn6152wMinymzTohVpteRQ1UUuE5C54Da2FHTksXBYrIqQVA5wQac
         y4y1sVB9qsqT2e6HM1grV4/4a0msTMFxbF0Bvg4f7fiw8Kmso4PeOD+3Ewp0IspnbD+2
         NAo5mqw3wYfUUdSvU+LUdZy8+CxlXAMKwd8gBbySu8cqiwLYTHGdwBqqc9X//ofIADDB
         RJE6hNsEMBqqL06oLtOkCFh6a81DZE6MO0uA7xPZBSW51RaVhXdON4OmmYrPn0ptwlKY
         mGPQ==
X-Gm-Message-State: AC+VfDyw+z5PYbFrk4Zj7NngIU8JJOrDk1dcuT0yHoR+jqahb37z00kl
        osTeSqXpiMVJq7zOmf0cjd9TAQcdQiisPk9I9v8=
X-Google-Smtp-Source: ACHHUZ6yCTO4qWaZ+elCFgZsYDwva29nPWDed2bqNBmuq05XgsEOe/kiAjaGY7XMikEplfBcTy1qpg8otj1A0ml0zpQ=
X-Received: by 2002:ac2:4d19:0:b0:4e9:b64a:b87d with SMTP id
 r25-20020ac24d19000000b004e9b64ab87dmr266324lfi.9.1683060768962; Tue, 02 May
 2023 13:52:48 -0700 (PDT)
MIME-Version: 1.0
Sender: affoarimyaou@gmail.com
Received: by 2002:ab3:6297:0:b0:229:e329:a0c with HTTP; Tue, 2 May 2023
 13:52:47 -0700 (PDT)
From:   Kayla Manthey <sgtkylamanthey73@gmail.com>
Date:   Tue, 2 May 2023 20:52:47 +0000
X-Google-Sender-Auth: 1_3GgLnvnmNzcNMdBqRod3KrcE0
Message-ID: <CA+erknwkuw169uQcdf0fudoHkvE0ptPK411MseMej+4Y+78oUQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello, Please did you get the previous message? thank  you.
