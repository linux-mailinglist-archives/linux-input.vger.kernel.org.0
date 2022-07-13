Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9715730EC
	for <lists+linux-input@lfdr.de>; Wed, 13 Jul 2022 10:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235594AbiGMIXJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jul 2022 04:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbiGMIWo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jul 2022 04:22:44 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA40EB036
        for <linux-input@vger.kernel.org>; Wed, 13 Jul 2022 01:20:36 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id j65so10059205vsc.3
        for <linux-input@vger.kernel.org>; Wed, 13 Jul 2022 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=1Ey+uaCMVT4hiM2bi4CjkHvDaUe0EstHF51AGXh6sLo=;
        b=XqAmBIbZ4J3ZrLk+gdSbVcAq1f69A7b6WPHhu+fOoJv3Mxokvoi5iTTQIyUJdYannN
         TLdIW6mPx+JvoDLgUE8xFTDDiC5ZWmKpJxSld3dp2HI462X3NcuIABpnLYQZ2z0aatOo
         lrRwGDqsIvMJ9IkHYe4lssHBEktT0MQMpvl1HCX48Dxih7zVNr0X8h5OW3UiJbQFz+zu
         0PfqCHQnkDg0mHSpBM3x33oCI35MwT0xUARftj52ykQ3fcwsEZhzrIQl69fqib3xIpWq
         rm2zC2ZvREHcNCStN/qzkXfZT8wj7N3PDduKrKhiEptUuWvwBOlxCK1AkGpsLotYnHSe
         naSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=1Ey+uaCMVT4hiM2bi4CjkHvDaUe0EstHF51AGXh6sLo=;
        b=r/Go+oltS7tL62chjjWn6how4iRDk/9fJ7lA43I65+tqNY4MrKvP7aR17k3ZEi0GM1
         iN4fSXwRY5rUqbTahsv1gLRP19AOKeVlKkFQ5ontwcDbgcEYWtqVPlkh/Tk6hpZoNmyT
         IOUJyrtismt2kE76LlVaGGMn9JrCOmhx9/KzgNcOI72N8wYD1l1UMZlTW0NIMbwNuQV4
         E7DronemLLCN7946A5WG4dW7nTdKiMg2YBjG4yjCqNuVxVO66Yvo9KXPVMwJWCGMrRdt
         /R91g+nkTu6ncuSZqhc9HTosRqCVnIRORBHCUPIZYHdnBr18jQL1aI7GFh7AggVvcTHU
         peDQ==
X-Gm-Message-State: AJIora+mSEFjgwSPMt1egr8eBhx+F9FW/0wVbaAPXqoRBi/Pm7p8Nj7Q
        iEHtvMvKodRERS84mvuxWRqTWRJrIh+ZyfZDcms=
X-Google-Smtp-Source: AGRyM1uKLOc3WAT/WOSgFmeb/OiEXtBVB3vSw6OixgQseUelo5QeKH1MZAQb6UBah74THYQGnwkZ4LzUQ7ItHBVxTQI=
X-Received: by 2002:a67:b70d:0:b0:357:8dca:634d with SMTP id
 h13-20020a67b70d000000b003578dca634dmr332051vsf.62.1657700433738; Wed, 13 Jul
 2022 01:20:33 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylamanthey612@gmail.com
Sender: sgthester742@gmail.com
Received: by 2002:a67:d498:0:0:0:0:0 with HTTP; Wed, 13 Jul 2022 01:20:33
 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Wed, 13 Jul 2022 08:20:33 +0000
X-Google-Sender-Auth: yajCGw7w9QblMmyzURYZwQdpl3Y
Message-ID: <CAJOpg3kWVJeVgVuWunJSjRqVkKkjEKEN9TVqNPSJkUgg=wNciA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

H=C3=A4lsningar, hur m=C3=A5r du? fick du mina tv=C3=A5 tidigare mejl? koll=
a och svara mig.
