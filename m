Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C8F32E1A8
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 06:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhCEFjd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 00:39:33 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54592 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCEFjc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 00:39:32 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 21:39:32 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 21:39:30 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2021 11:09:03 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 4FAA73C33; Fri,  5 Mar 2021 11:09:02 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 0/3] Add support for PMK8350 PON_HLOS PMIC peripheral
Date:   Fri,  5 Mar 2021 11:08:38 +0530
Message-Id: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

David Collins (2):
  input: pm8941-pwrkey: add support for PMK8350 PON_HLOS PMIC peripheral
  dt-bindings: input: pm8941-pwrkey: Add pmk8350 compatible strings

satya priya (1):
  dt-bindings: input: pm8941-pwrkey: Convert power key bindings to yaml

 .../bindings/input/qcom,pm8941-pwrkey.txt          |  53 -----------
 .../bindings/input/qcom,pm8941-pwrkey.yaml         |  78 ++++++++++++++++
 drivers/input/misc/pm8941-pwrkey.c                 | 103 ++++++++++++++-------
 3 files changed, 150 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

