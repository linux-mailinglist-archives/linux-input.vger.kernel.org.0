Return-Path: <linux-input+bounces-13450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6CCAFFADE
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 902B9641E38
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 07:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BBE28935D;
	Thu, 10 Jul 2025 07:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="BfEBPzrN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2221288C87;
	Thu, 10 Jul 2025 07:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132525; cv=none; b=KB8mHg0OYBz3BRTFuBas67qjLI9vTndSYwb9qPwn73h+LTPnqa8oV120+bkxx56StFbk31IsBM6Poqvb3yYnx2H+hsjGfeuvOOeSUbkYIk8xI7jFcwSSJ4TSvMR1x1WZVK6NLOFFFyBZhvXSGb0LoJrtuoefzqc9RYexDEA6PEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132525; c=relaxed/simple;
	bh=ltsU2DaNx9FwZfeJePEEPtIpFJ9EKoFKIkD3tPAkC8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Be/HTgiktOE1wr42luzBbTzK34q795XrsJBmC3VeIQuBEFfL1iMAMZrDdmgR3AbF6fsZqnoLjriJNrjkTaTnsE/q3xH4yxbj7vWbYNuM6jpdwKGcbuvX1sK0jdcv7D/ONICMfgpoPv1CfaTwiKRKR9rXK05Y/vl4AoCoH+suD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=BfEBPzrN; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752132479;
	bh=E5rR1x3jzWaA7GLvcOcQ7JJQ6DV+iJkrxTt3uzOCykU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=BfEBPzrNd8RZQL56FxyPbWSXGY2buV/hVMynuZCgykAwMcNd2CNcf93+bvDfVvuJE
	 0aj8CQeADQWEflfv0ci1AR8fDOKwREcuFD9YW3Ltw75MWEOhIOPXtKPf/tDDY3qW5U
	 QzVv7gtEBuPlwOqQwroxfwOYxB3oh7YmOJEsRIHE=
X-QQ-mid: zesmtpip4t1752132428t0bb912da
X-QQ-Originating-IP: DkPxi8Ft6VPmSHbgpYt3nR1mkcAgx4FrFGbifsodIBE=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 15:27:06 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11508008740617986207
EX-QQ-RecipientCnt: 12
From: WangYuli <wangyuli@uniontech.com>
To: dmitry.torokhov@gmail.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	wangyuli@uniontech.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	wangyuli@deepin.org
Subject: [PATCH 0/2] input: Add tracepoint support
Date: Thu, 10 Jul 2025 15:26:34 +0800
Message-ID: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OFMq6CCtBSIOhGYybtgqnGq1rrspX3uZ7KG/4ljlE6fuqtmUK16ndG4U
	IQHM4OSWQi5UYPsbfW54fJqfJFYQzZeF+Z8K+QQihHBMZOfVd9htcsULWnX+e5Rdourwkzb
	4Ihmf25+YBk31EgIwhYjRF3g3MNBpJ07FYwhHaIWVM03UzG75+IZ9/daiqLQgg4K6Yu/1Xy
	SyZMPZ5vW8/CcrEB4tE6RMe6n/rkJVN4DKzmFIVzz4xReE7RDEaAmhd/eqHZz47Nh6nkEUS
	V2BpobRsswI3xCKV71hP810/luTuebiF4ZfA5x5ORaEyneF4F4f7PwLTVoerEk8umK2y90W
	0IqU2yTy6PYr0Hvc6y7VFvh89gGvGYo9zfV7drS4p1V7dVttxUt4Ta/fSV97vOf9X4wDPHV
	HUKMnGia0S5n+AgDYtU7nGJ4JYyIO7ZR4j2AI1dzAPPZrUQ2fGBDWMo+p5pJSab9d9+J9yV
	fwvr/ZZqRPsNntytGkQr+SINbl0DuQmUeeDwQuQhPF996aqSU189x4x2tF2gwVUVwx4uqcF
	XiUbfpm5UTBpiu61XqaYr/xkSCSdmKPvFB8HKcutfyQL/0p1d1iMN0CTR7nIGipw/rUmULu
	Q3WYRPh90nqfygRiC83BRp193STFoy6/s6F6hscshBeNyIjmZQmBVyfSHG6txyUJ1jSnG5i
	J6Iz8E71PfCKumBepZmLfXJZDKrwFt+rPGC9Jsac1NckID481Pob6GKtX8f3b8QH8ljojFa
	TZtSddUdvobADsQqR16TXrkripackDZWjcErJ+nbmSngWOPUzyoyvxzM7MWGSSz1ZxEiRbi
	iDVNVYvnHqp6ok+SlRTn48uj+ERm+RQpnaInRtxza0kuIF7LHYt73Vclz05aAG6EmxTK8UY
	2/AjOiCZFhrWqBWDJZU6Kx8WHNaErt2HWNFJ0q3lh5LeIWay/LW/pOCZbzm6szy9ZqF+mr5
	Hh+j9dTAjhSku+YlVU1mXMJSFj+xBsFCLl4Md6Dyvs4L/NhaK+tmpLXNBP+GE+5bZtMKEVP
	kWOIaVSGAYvOZ61oiLlpYswfXjNZJbifgsChY0gv9lsQGfGzEAdo6/Z25eKBM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Introduce a set of tracepoints for the input subsystem to enable
better debugging, monitoring, and performance analysis of input
device operations.

WangYuli (2):
  input: Add tracepoint support
  selftests: input: Add tracepoint testing script

 MAINTAINERS                                   |   3 +
 drivers/input/input.c                         |  18 +-
 include/trace/events/input.h                  | 251 ++++++++++++++++++
 .../selftests/input/test_input_tracepoints.sh |  78 ++++++
 4 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/input.h
 create mode 100755 tools/testing/selftests/input/test_input_tracepoints.sh

-- 
2.50.0


