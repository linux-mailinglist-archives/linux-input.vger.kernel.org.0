Return-Path: <linux-input+bounces-5875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141C95F4C8
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 17:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A9431F25413
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 15:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21C0192B95;
	Mon, 26 Aug 2024 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bRqcjasO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705F1925A1;
	Mon, 26 Aug 2024 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724685128; cv=none; b=L52ON/mOriV93ndLfFlPxYK7boaSIC8kTh1sOwRu/iBj5HC9vseX2H7sVZdGwrrkcKcdZe2DG7rwxU6QsHAeMOfm+n7jk6ugWSuT+bO0mNOOrFe7wprvggkYvSRM+dzGtkMkrKnYagrnQBEDHP1/JXBedb8sIlETJR1SCiJHGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724685128; c=relaxed/simple;
	bh=MNySsTMjSfq+h1YPOUlX+67nt0L84v5H9Fl6brzwTkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I+g4V7+XFlksSyC56ShD8JwnSuv6E9Kb/O5vvM1+i+Lftzvd6OT1rhj52Iec0MYITlapn6x+w1cHTtffzVCv2porxlFmxUeRIO4vewxKf1VDgsuL5w0nKP4KmxrCkXE+PeMFzURMDKpjGaBjyo8HeoJrTBCiuWcme5RC98RBx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bRqcjasO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q8MSR5003106;
	Mon, 26 Aug 2024 15:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2WGmtVoNopml6AxDzLxFtlGo8E8wIzrXO8d4WxlEMaA=; b=bRqcjasOwsmas9aV
	UYudAUzthwzDtTcb2T2KNGHLiCBmz7L29S1nPWntYunXe2nT2OY10QXKhO0TI5fn
	udCVuc+e5aF/0ETvRBLUPo9KyQa3aDD+JsEmPQw2kNlaKHQ4Lxbun4sn23ew89ou
	DzgXtpeSm+hYKJmSUFnifZ2vUdVcqTYnOt5r86rZxUKEMARX4UgZ41guO7sYSNhC
	kyVhmgrpI2UWJjpywhtzA+2Iw4tmnBRBkUnOFFMkJQd9UfqGPfYhc3N4kB+zbeuS
	ktw2SuN2EV+IoMVk5HKcvuH1W2ztm2JNrjva+WOpYr8a05Y3YfpZ+2dyfoRbeP1D
	ySTzRg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41796kv1b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 15:11:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47QFBi60008804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 15:11:44 GMT
Received: from [10.110.100.101] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 08:11:44 -0700
Message-ID: <5459c1bc-33eb-41ad-b290-3d40bb5b81fe@quicinc.com>
Date: Mon, 26 Aug 2024 08:11:43 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 01/33] xhci: add helper to stop endpoint and wait for
 completion
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-2-quic_wcheng@quicinc.com>
 <9f25b900-ae1c-41af-a380-ac5e00860283@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9f25b900-ae1c-41af-a380-ac5e00860283@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tzt44VPgerTf-ShlyNRILMJIgpSquE64
X-Proofpoint-ORIG-GUID: tzt44VPgerTf-ShlyNRILMJIgpSquE64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_12,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408260115

Hi Pierre,

On 8/26/2024 1:48 AM, Pierre-Louis Bossart wrote:
>
> On 8/23/24 22:00, Wesley Cheng wrote:
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>
>> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
>> xhci_queue_stop_endpoint().  This is useful for client drivers that are
>> using the secondary interrupters, and need to stop/clean up the current
>> session.  The stop endpoint command handler will also take care of cleaning
>> up the ring.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  drivers/usb/host/xhci.c | 39 +++++++++++++++++++++++++++++++++++++++
>>  drivers/usb/host/xhci.h |  2 ++
>>  2 files changed, 41 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 37eb37b0affa..3a051ed32907 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -2784,6 +2784,45 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
>>  	return -ENOMEM;
>>  }
>>  
>> +/*
>> + * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
>> + * waits for the command completion before returning.
>> + */
>> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
>> +			    gfp_t gfp_flags)
>> +{
>> +	struct xhci_command *command;
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	command = xhci_alloc_command(xhci, true, gfp_flags);
>> +	if (!command)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_irqsave(&xhci->lock, flags);
>> +	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
>> +				       ep->ep_index, suspend);
>> +	if (ret < 0) {
>> +		spin_unlock_irqrestore(&xhci->lock, flags);
>> +		goto out;
>> +	}
>> +
>> +	xhci_ring_cmd_db(xhci);
>> +	spin_unlock_irqrestore(&xhci->lock, flags);
>> +
>> +	wait_for_completion(command->completion);
>> +
>> +	if (command->status == COMP_COMMAND_ABORTED ||
>> +	    command->status == COMP_COMMAND_RING_STOPPED) {
>> +		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
> nit-pick: is this really a timeout? In that case you would have used
> wait_for_completion_timeout(), no?

With respects to the xHCI command implementation, every time a command is queued to the host controller, it arms timer (xhci->cmd_timer) that is used to handle the timeout conditions.  This is the reason for not using the _timeout() variant, as we can let the xHCI command timeout handler do the cleanup and stopping of the HCD. (marking as dead)  It will also ensure that any completion events are completed as part of the timeout handler as well (xhci_handle_command_timeout() --> xhci_abort_cmd_ring())

Thanks

Wesley Cheng

>> +		ret = -ETIME;
>> +	}
>> +out:
>> +	xhci_free_command(xhci, command);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
>>  
>>  /* Issue a configure endpoint command or evaluate context command
>>   * and wait for it to finish.
>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
>> index 30415158ed3c..1c6126ed55b0 100644
>> --- a/drivers/usb/host/xhci.h
>> +++ b/drivers/usb/host/xhci.h
>> @@ -1914,6 +1914,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
>>  void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
>>  void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
>>  unsigned int count_trbs(u64 addr, u64 len);
>> +int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
>> +			    int suspend, gfp_t gfp_flags);
>>  
>>  /* xHCI roothub code */
>>  void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,

