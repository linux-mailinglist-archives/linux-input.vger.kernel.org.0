Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139A757F5D4
	for <lists+linux-input@lfdr.de>; Sun, 24 Jul 2022 17:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiGXPj3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jul 2022 11:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiGXPj2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jul 2022 11:39:28 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D8FB79
        for <linux-input@vger.kernel.org>; Sun, 24 Jul 2022 08:39:27 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id q3so5931965qvp.5
        for <linux-input@vger.kernel.org>; Sun, 24 Jul 2022 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8VIzIFTyBEUQIIzGosk4yTmdHzzanN/OBRxEvFpVO2A=;
        b=e1HYf22LlsoYmV/AU5Fe0punox+pzmVPh/r937Vb1hqCcBUT4DI1kN+GLNFtzHr7vO
         /w64v4QgQTk1wROC9G96i4LpDwxFGzQjUApdJ1CiqZoSfYpJNaRdjncrij4WPGcGKLKg
         BCIr0w1eor7RQSlMhQSpIp3gQuzVYfLTI52x5iyKuJMUV1BR3A6guBwW8Ri+gDgwT3i/
         +fM/heBL6xemzbG8a7Wh3yrt4Jnl4A01Bl5QcLnSaTlqTY8WPS/PeEFxUwBgU+6gf58N
         2XFl0S7CUmlw00vMRyXVujJl6jtRM7N88CgDBcGPKjniKbdL68+tSKmTEarm4y1W/U7V
         nMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=8VIzIFTyBEUQIIzGosk4yTmdHzzanN/OBRxEvFpVO2A=;
        b=yS4Esl7zgrYXzRgcLok9dUP4LHqVbIerogPXcp7sXC7XtdrUMLJFMYZpSr9OybFIVB
         vuD4AiYZVcEsRYavNMaaPvY3Ls/1LhSSAws8sZlNYimNuvnYLIWkWXy229NWmyZOK60l
         6zhd/jLrGxzp6YanEXosuBs7tQ/htAHCzm7PVdQEC+KWL1MX5k9gtOP53FvMIUVIKTn4
         z4eruZ03qMjasma2w+xcA+9qQpeaUwav9noNzqHbS7xCtTnrSoh4A1nGQBEu7+Lxo+CA
         mRWpiEKNbM0pis3/w7SPREGuFF7kYUbFpaDVizVRAHufksMrFSFWs/tkN8I1RwbMp7PY
         r7iw==
X-Gm-Message-State: AJIora+K+IXDMVk8WxPvmmRZxh9vE7Q0ptouKJU9VJVwVX5cKjggjm3p
        n2HAKuTn3dX8aS+Ws6qMRts2idnw8BjdFsi1nuU=
X-Google-Smtp-Source: AGRyM1vrXXQ1bUw8Cs+fihSSRCS52U3goWzBReMj2Icuu58arHzQ+BUHFwdnv/X7NciYXhdCUBWgX4drRWANlkdIpRI=
X-Received: by 2002:a0c:dc85:0:b0:474:c7f:5e79 with SMTP id
 n5-20020a0cdc85000000b004740c7f5e79mr7320813qvk.84.1658677166647; Sun, 24 Jul
 2022 08:39:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ad4:5c88:0:0:0:0:0 with HTTP; Sun, 24 Jul 2022 08:39:26
 -0700 (PDT)
Reply-To: deborahdonatus60@gmail.com
From:   Deborah Donatus <ishaacismail@gmail.com>
Date:   Sun, 24 Jul 2022 15:39:26 +0000
Message-ID: <CAKqRkh9bdmGcyuuSNsNc7+B_tuzg7wcB5yjOydYyjo_FpmvBuw@mail.gmail.com>
Subject: please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear ,

=C2=A0 Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be mostgrateful
if you could help me deal with it please.

Deborah
