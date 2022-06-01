Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9B7F53AED4
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbiFAUwj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbiFAUvQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:51:16 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E65F1201FC9;
        Wed,  1 Jun 2022 13:49:34 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id i66so4155196oia.11;
        Wed, 01 Jun 2022 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxhvAlPyxmnv90RCHPOsFC3pi+Lj/R+Q75ymRh58+0k=;
        b=XY0brR2rbu0Fb2XN/uHd1roSFDc1MrMI0JVEfTeq2ElXUBk5eA5kD+Yt1tp+FSVFsV
         7ENkwqT8vPASnJnlt4h6eUaw1Okbxu3vhDUkl0ym/qY70rZTXZ2Woone7g5mExdnddia
         m6K6g8tZ83ag9kzM21kpxaxawmAJObMW+BbZl6ZnGjcrt1kn4R7m6hraQriNC0Djqglz
         4E6D40rf+d7GpkZjH7C7tOi7xF5NiPWki6O0WddSGAZ1mlhWv/ArCKTE+BqoCM4zRXDJ
         4E8cVgE1+p8mcMMjqXtoLvns0Dlu7Tj79LsC4QiFhT8Te2m6L7F38AGME8K+fdn6S/h8
         WUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxhvAlPyxmnv90RCHPOsFC3pi+Lj/R+Q75ymRh58+0k=;
        b=Wwca97SRFha/qFfG+x4tCz/Rx9cP1cisIEoj3YI56efHhvvADYYXFPFH8slokwQa/q
         BMUWKjXcJoqh52kc9uwEXqSruj41DWeaZCOB5oy+ih2X68OT1Tftg5NMrpqzeLJdhYBW
         EpXLPY0EmKPgrnSVGN5oXWmkAZYeuyVtSC+EQWBO3WLIEeaazU1t09vnkzhq9IyhO5S0
         VhR49DQb7+6D5WxTWTeymGlwUv8FC8DsowmFDjyjwCzoZj+oWlUDvpjH9WsklErPlpT+
         ML1+At3KU536uv6Y+PolgBiUn0m0AuENi6o0eW8ButGzQEkxbljFzTrkXL9yamm4f+9P
         E0XA==
X-Gm-Message-State: AOAM532Er5NfvMx3bCJctbK+ke686bEKRUP8Ykus7zz80v7I049XIAY3
        U5GF72CqgIUmQMia/9r8R2v0dp56CeMDMw==
X-Google-Smtp-Source: ABdhPJxZjbud6np/5begmYYLuECQlEpCfWfyWAv+MlfRURrDFDWWZFZPbh+RczIG6pUMuQSjOzXN+g==
X-Received: by 2002:a05:6808:23d3:b0:32c:4460:b19e with SMTP id bq19-20020a05680823d300b0032c4460b19emr6672662oib.100.1654116571009;
        Wed, 01 Jun 2022 13:49:31 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id 3-20020a9d0b83000000b0060603221279sm1222157oth.73.2022.06.01.13.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:49:30 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 0/3] adc-joystick: Add polled support
Date:   Wed,  1 Jun 2022 15:49:24 -0500
Message-Id: <20220601204927.10256-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support to the existing adc-joystick driver to support polling
rather than relying on triggered buffers. This is useful for devices
that do not offer triggered buffers in hardware. Code adapted from
changes made by Maya Matuszczyk <maccraft123mc@gmail.com>.

Changes from V1:
 - Removed driver compatible string of "adc-joystick-polled".
 - Added new optional boolean value of "adc-joystick,polled".
 - Cleaned up if statements regarding polling behavior.

Chris Morgan (3):
  dt-bindings: adc-joystick: add adc-joystick,polled option
  Input: adc-joystick - Add polled input device support
  arm64: dts: rockchip: Update joystick to polled for Odroid-Go2

 .../bindings/input/adc-joystick.yaml          |  9 +++-
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  1 +
 drivers/input/joystick/adc-joystick.c         | 52 +++++++++++++++----
 3 files changed, 50 insertions(+), 12 deletions(-)

-- 
2.25.1

