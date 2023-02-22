Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A57069EBC1
	for <lists+linux-input@lfdr.de>; Wed, 22 Feb 2023 01:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjBVALm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Feb 2023 19:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbjBVALm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Feb 2023 19:11:42 -0500
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DA3265B2;
        Tue, 21 Feb 2023 16:11:40 -0800 (PST)
Received: from fedori.lan (bc065635.dsl.pool.telekom.hu [::ffff:188.6.86.53])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FA81.0000000063F55DBA.002C9F55; Wed, 22 Feb 2023 01:11:38 +0100
From:   Gergo Koteles <soyer@irl.hu>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>,
        Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v4 0/3] Add alert-slider for OnePlus6
Date:   Wed, 22 Feb 2023 01:10:31 +0100
Message-Id: <cover.1677022414.git.soyer@irl.hu>
X-Mailer: git-send-email 2.39.2
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

V1 -> V2: rebase to qcom/for-next
V2 -> V3: rename tri-state-key to alert-slider, fix DTS warnings,
add SND_PROFILE_* identifiers to input-event-codes.h
V3 -> V4: DTS: use default debounce-interval, order alphabetically

Gergo Koteles (3):
  Input: gpio-keys - add support for linux,input-value DTS property
  Input: add ABS_SND_PROFILE
  arm64: dts: qcom: sdm845-oneplus: add alert-slider

 Documentation/input/event-codes.rst           |  6 +++
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 39 ++++++++++++++++++-
 drivers/hid/hid-debug.c                       |  1 +
 drivers/input/keyboard/gpio_keys.c            |  3 ++
 include/uapi/linux/input-event-codes.h        |  9 +++++
 5 files changed, 56 insertions(+), 2 deletions(-)


base-commit: 02ac8d2a011b630481d959298a1cc76ca0717f3e
-- 
2.39.2

