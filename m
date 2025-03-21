Return-Path: <linux-input+bounces-11061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531EA6C3E4
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 21:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 692A7468AA0
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 20:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD3B22FE1F;
	Fri, 21 Mar 2025 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lzwYbugI"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E880622DFA6;
	Fri, 21 Mar 2025 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742587639; cv=none; b=ew9FzrS1M/NMp0fKAmXA97Aw9YLF7KH2CL5ElIv/lM7ChagPWm3DWZMWm4mclN5dB8eNMaQaR+l6ZHDJqjdhjRgQgCxSMnHZadP5BM/9XKRN8aOSA3B14qc14QVPZB3TT0je9xcOUmUD0UsWgctAgpDf0N3q6KcDzmIY/c4df2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742587639; c=relaxed/simple;
	bh=19oUotyDOCLDkmDdkLpuedsgL2cIAvuGUJEHwHnOgLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cvi5Fgg/bodmrxfmk+C85EL4y0gPd+J1XKZicKr2i47rDQlgWEG/s8vPBGLePcpXbcbdLdv5Fsa5LjJxsRT+Vg2Udxix6rElIBViHsB3bo0l1oJmHzXj7J4KVEpJk1DLIkMtoxozonyB2940cFcY9fhGdssdqp8SsOcSj9RaGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lzwYbugI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LAT9tR022053;
	Fri, 21 Mar 2025 20:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAZWiy3q1WUqRoaiLvI9dIJslrFXt+ABgbRRNuix8fQ=; b=lzwYbugIwJgPebOs
	BZR/l5K91Y2wuiUb0UD3Gi7Gp32OKbT04rL0j0kY2MF0WH8SVRX2CbYm6IcqVEjr
	UID4lkN8eXiMXF/SQFE2TQX0ARLW71+kODkzxdwYzQguDZ1sl9M3Tbnuku2fclWR
	XwKEWoejSh+d/reKnd9s6JZaVnBQy9G2DALzyxBFZafiZqYuhNxWMalDgW+aVIAT
	siR2Wu0TpyOlc8YgHvTYzJq3cdlECYH1/Pk6wolEN0E/98dxw3JzPf27VlCdu8Ka
	a3ftzIEA5yAs9xy8FjeOS//ZCL0XT3viLGRdbVAb935rNz8sCjkGrWvlbLTe/3ev
	EQ9ZYA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wphrb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 20:06:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LK6nCH020958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 20:06:49 GMT
Received: from [10.71.113.245] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Mar
 2025 13:06:49 -0700
Message-ID: <5ba0912a-4d8c-4321-9fa4-0bac89af8224@quicinc.com>
Date: Fri, 21 Mar 2025 13:06:43 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v36 00/31] Introduce QC USB SND audio offloading support
To: Luca Weiss <luca.weiss@fairphone.com>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <tiwai@suse.com>, <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <D8LYYEQJ2W4L.1H7FPF4140BVS@fairphone.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <D8LYYEQJ2W4L.1H7FPF4140BVS@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8zEwo_wZhHpbeBVNYzwvKCMZbXs1_InH
X-Proofpoint-GUID: 8zEwo_wZhHpbeBVNYzwvKCMZbXs1_InH
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67ddc6db cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=qC_FGOx9AAAA:8 a=NEAV23lmAAAA:8 a=XwCJkI7jc2rzYGe07aMA:9
 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210149

Hi Luca,

On 3/21/2025 6:13 AM, Luca Weiss wrote:
> Hi Wesley,
> 
> On Wed Mar 19, 2025 at 1:51 AM CET, Wesley Cheng wrote:
>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
>>
>> Several Qualcomm based chipsets can support USB audio offloading to a
>> dedicated audio DSP, which can take over issuing transfers to the USB
>> host controller.  The intention is to reduce the load on the main
>> processors in the SoC, and allow them to be placed into lower power modes.
>> There are several parts to this design:
>>   1. Adding ASoC binding layer
>>   2. Create a USB backend for Q6DSP
>>   3. Introduce XHCI interrupter support
>>   4. Create vendor ops for the USB SND driver
>>
> 
> I was able to test this series (v35) on SM6350/SM7225 Fairphone 4
> smartphone and it appears to work as expected!

Thank you for taking the time to testing this :), much appreciated.

> 
> Based on the sm8350 branch you shared[0] I added similar dts bits for my
> device, I've pushed that branch here[1] for reference.
> 
> [0] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commits/usb_audio_offload/
> [1] https://github.com/sm6350-mainline/linux/commits/sm6350-6.14-wip-usb-snd-offload/
> 
> And I've used these commands to test:
> 
> fairphone-4:~$ amixer -c0 cset name='USB Mixer MultiMedia2' On
> 
> fairphone-4:~$ aplay -l
> **** List of PLAYBACK Hardware Devices ****
> card 0: F4 [Fairphone 4], device 0: MultiMedia1 (*) []
> Subdevices: 1/1
> Subdevice #0: subdevice #0
> card 0: F4 [Fairphone 4], device 1: MultiMedia2 (*) []
> Subdevices: 1/1
> Subdevice #0: subdevice #0
> card 1: Audio [Hi-Res Audio], device 0: USB Audio [USB Audio]
> Subdevices: 1/1
> Subdevice #0: subdevice #0
> 
> fairphone-4:~$ ffmpeg -i test.m4a -acodec pcm_s16le test.wav
> 
> fairphone-4:~$ aplay --device=plughw:0,1 Music/test.wav
> Playing WAVE 'Music/test.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
> 
> And then music was coming out of these headphones connected via a USB-C
> to 3.5mm dongle.
> 
> Every time I'm starting playback this error appears in dmesg, do you
> also see this on your test setup?
> 
> [ 1336.081525] q6afe-dai 3000000.remoteproc:glink-edge:apr:service@4:dais: AFE Port already open
> 

The print is coming because the Q6 USB backend DAI link is utilizing the
q6afe_port_get_from_id() API to fetch the proper AFE port to issue commands
to.  IMO, that log level should be decreased to at least dev_info() instead
of an error, but we can probably take that discussion into a different series.

To add, I also see this on my set up.

> 
> And if I'm not mistaken it's possible to check that actually the offload
> path is getting used by checking the interrupt counts of the xhci-hcd
> interrupt.
> 
> With regular USB audio card playback there's many interrupts per second
> happening:
> 
> fairphone-4:~$ aplay --device=plughw:1,0 Music/test.wav # regular USB
> fairphone-4:~$ cat /proc/interrupts | grep -i usb
> 188:     137524          0          0          0          0          0          0          0    GICv3 165 Level     xhci-hcd:usb1
> fairphone-4:~$ cat /proc/interrupts | grep -i usb
> 188:     137591          0          0          0          0          0          0          0    GICv3 165 Level     xhci-hcd:usb1
> 
> And with the offload card during playback there's no interrupts
> happening (just a few when initially starting playback):
> 
> fairphone-4:~$ aplay --device=plughw:0,1 Music/test.wav # offload
> fairphone-4:~$ cat /proc/interrupts | grep -i usb
> 188:     141947          0          0          0          0          0          0          0    GICv3 165 Level     xhci-hcd:usb1
> fairphone-4:~$ cat /proc/interrupts | grep -i usb
> 188:     141947          0          0          0          0          0          0          0    GICv3 165 Level     xhci-hcd:usb1
> 

This is correct.  With offload enabled, you should probably only see a few
interrupts from xHCI from the initial USB headset enumeration and control
transfers, but the data packets itself should result in no increase of the
xHCI IRQ.

Thanks
Wesley Cheng

