Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61DF61DA4C
	for <lists+linux-input@lfdr.de>; Sat,  5 Nov 2022 13:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiKEMkF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Nov 2022 08:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiKEMj7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Nov 2022 08:39:59 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9950D15FC1
        for <linux-input@vger.kernel.org>; Sat,  5 Nov 2022 05:39:58 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13c2cfd1126so8204554fac.10
        for <linux-input@vger.kernel.org>; Sat, 05 Nov 2022 05:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=mu8m7znM9duu/MEuox3wxE9uI+enJzfHDrHCiCJ0dxXEnbtqlugP30RV4pUA4LaD8D
         DTqzL6R3iJdygnN0tebcl2jKMC1xnk2qmH9yHj5ZpYJsig0zgAkFbQEJMtQOsyMS9E9+
         9mZsd+BXbCYizoNZILloIeJgVKBYQDDlfcxWmhtehgP0gShVz6QbysTuA73O0zNW89oN
         M95vp9qd39mlLDduLYXTQkqHXtcuCB6sr4c0ysKpoCTw5s/vT8zmw06SHC/DLusZ9o66
         sNkDbmLIhAcJBtA+VmbRSjB+l+4rXBDt3pKOG75zF9L+vjSBjo5n2zZjo+rRsufLH5jZ
         6xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8XA1N0uaxkLO/wKHErNWHaSuu64k5Pjb5u9dmcZrOc=;
        b=hQOhnc5zuYgYOz/KCbIpnMM0XjpcYiaP7AZyKGtoEo8LyapNQmeoyxEpFPGKdjw2J8
         Tgoog8ieuAFLLpi9QmGBmbwMYdgqkAOe+OL3WKD4tA7sApdJp0aRGE9D3kboo8LTwxUh
         CRgDHY07Pa3J8RvlC6X2BdvUjyUZhLvjTxkHuwLscFR3VjEcT7gGXaNkCN7WcvWNu/9D
         9deL2Nvy3q0YySRe4De9QpK/9Zb6/u/WvMRsXlbuqA4o4NfGgWkXcAGVTLPgH6rFOZvt
         sIKOgK1MyNPWPMYCpVsSRvc/Ee8VyrV30Gn22r4h8KcP2JeyFb6mPAiEn9Sc9liy+n55
         YIhw==
X-Gm-Message-State: ACrzQf0gm0VSWOGes1qanZbQU2u9j+ymOX0ZnZMPyss2+PU6qI/ueDGb
        1btqFG1FiGC/7Ku+fZyh2Nz13zlZLm1kw6RKqsRi6hQJejI=
X-Google-Smtp-Source: AMsMyM5GFe2gsiMaHXHXvp99K7JeNN2UuK6dELDyLpsoJjIUkQcn4q3aD74FbKEapmwctM2YF8x1D4LMLHeg4fM3LVk=
X-Received: by 2002:a17:90b:4ac3:b0:213:3918:f276 with SMTP id
 mh3-20020a17090b4ac300b002133918f276mr57022678pjb.19.1667651987563; Sat, 05
 Nov 2022 05:39:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7301:2e91:b0:83:922d:c616 with HTTP; Sat, 5 Nov 2022
 05:39:47 -0700 (PDT)
Reply-To: stefanopessia755@hotmail.com
From:   Stefano Pessina <wamathaibenard@gmail.com>
Date:   Sat, 5 Nov 2022 15:39:47 +0300
Message-ID: <CAN7bvZKO8GxFn7CG_EtS_Of+AZ+KsuqTkq40Mq-yJDNrEHyakg@mail.gmail.com>
Subject: Geldspende
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=20
Die Summe von 500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA gespende=
t.
Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen =C3=BCber
stefanopessia755@hotmail.com
